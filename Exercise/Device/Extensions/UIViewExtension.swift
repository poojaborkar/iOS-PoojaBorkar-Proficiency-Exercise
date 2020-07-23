//
//  UIViewExtension.swift
//  Exercise

import Foundation
import UIKit

extension UIView {
    
    //Specify the constraint for thr view
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
            print("Top: \(topInset)")
            print("bottom: \(bottomInset)")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
        
    func activityStartAnimating() {
        if let window  = UIApplication.shared.keyWindow {
            let indicatorView = UIView()
            indicatorView.backgroundColor = UIColor.clear
            indicatorView.frame = CGRect(x: 0, y: 0, width: DeviceUtility.SCREEN_SIZE.width,
                                         height: DeviceUtility.SCREEN_SIZE.height)
            indicatorView.tag = 789789
            let activityIndicator =  UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
            activityIndicator.center = window.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            indicatorView.addSubview(activityIndicator)
            window.viewWithTag(789789)?.removeFromSuperview()
            window.addSubview(indicatorView)
        }
    }
    
    func activityStopAnimating() {
        if let window = UIApplication.shared.keyWindow {
            window.viewWithTag(789789)?.removeFromSuperview()
        }
    }
}
