//
//  News.swift
//  JSON
//
//  Created by ByteDance on 2022/3/17.
//

import UIKit

class News: Codable {

    var title: String
    var content: String
    //计算属性
    var readCount: Int {
        get { read_count }
        set { read_count = newValue }
    }
    private var read_count: Int
    var isBig: Bool {
        get { is_big ?? false }
        set { is_big = newValue }
    }
    private var is_big: Bool?
}

class NewsList: Codable {
    var page: Int
    var next: Bool
    var list: [News]
}

extension NewsList {
    var displayText: String {
        let strings = list.map { $0.title }
        return strings.joined(separator: "\n")
    }
}
