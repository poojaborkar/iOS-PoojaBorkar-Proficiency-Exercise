//
//  UIImageViewExtension.swift
//  Exercise

import Foundation
import UIKit

extension UIImageView {
    //downloads the image task
    private func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    DispatchQueue.main.async() {
                        self?.image = UIImage(named: "default_Image")
                    }
                    return
                }
            DispatchQueue.main.async() {
                self?.image = image
            }
        }.resume()
    }
    
    func download(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        downloaded(from: url)
    }
}
