//
//  Constants.swift
//  Exercise

import Foundation

enum JsonFileName: String {
    case data = "Data"
}

struct TableViewCell {
    static var cellIdentifier = "TableViewCell"
}

struct URLManager {
    static let API_URL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts"
}

struct APIHeader {
    static func getHeader() -> [String: String]? {
        var header = [String: String]()
        header["Content-Type"] = "text/plain"
        header["Accept"] = "text/plain"
        return header
    }
}

struct ContentType {
    static let APP_JSON_KEY = "application/json"
}
