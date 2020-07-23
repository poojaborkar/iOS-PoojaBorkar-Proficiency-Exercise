//
//  TableContainerViewController.swift
//  Exercise

import UIKit

protocol TableContainerView {
    func initialSetup()
    func reloadTableView()
    func attachPresenter(presenter: TableViewPresenter)
    func showActivityIndicator()
    func hideActivityIndicator()
}

class TableContainerViewController: UIViewController {
    private var tableView: UITableView!
    private var presenter: TableViewPresenter?
    fileprivate var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initialSetup()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        presenter?.fetchData()
    }
}

extension TableContainerViewController: TableContainerView {
    //Initialise and configure views data
    func initialSetup() {
        let statusBarHeight = DeviceUtility.getStatusBarFrame().height
        tableView = UITableView(frame: CGRect(x: 0, y: statusBarHeight, width: DeviceUtility.SCREEN_SIZE.width, height: DeviceUtility.SCREEN_SIZE.height - statusBarHeight))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    //Inject presenter object from configurator
    func attachPresenter(presenter: TableViewPresenter) {
        self.presenter = presenter
    }
    
    //reloads the table view
    func reloadTableView(){
        tableView.reloadData()
        refreshControl.endRefreshing()
        self.title = presenter?.getNavigationTitle()
    }
    
    func showActivityIndicator() {
        self.view.activityStartAnimating()
    }
    
    func hideActivityIndicator() {
        self.view.activityStopAnimating()
    }
}

// MARK: - UITableView Delegate & DataSource
extension TableContainerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.tableView(numberOfRowsInSection: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier, for: indexPath) as? CustomTableViewCell, let cellModel = presenter?.getCellMode(atIndexPath: indexPath) else {
            return CustomTableViewCell.init(style: .default, reuseIdentifier: nil)
        }
        cell.configure(model: cellModel)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

