//
//  ViewController.swift
//  JSON
//
//  Created by ByteDance on 2022/3/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        guard let url = Bundle.main.url(forResource: "NewsList", withExtension: "json") else {
            fatalError("No url")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("No data")
        }
        
        jsonToDic(data)
//        jsonToModel(data)
    }

    //手动解析json数据
    func jsonToDic(_ data: Data) {
        guard let dic = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else {
            fatalError("No dic")
        }
        print("JSON dic\n", dic)
        print()
        
        guard let page = dic["page"] as? Int else {
            fatalError("No page")
        }
        print("Page:", page)
        print()
        
        guard let next = dic["next"] as? Bool else {
            fatalError("No next")
        }
        print("Next:", next)
        print()
        
        guard let list = dic["list"] as? [[String: Any]] else {
            fatalError("No list")
        }
        print("List:", list)
        print()
        
        for newDic in list {
            guard let title = newDic["title"] as? String else {
                fatalError("No title")
            }
            print("Title:", title)
        }
        
        //也可以把字典逆成json！
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dic, options: [])
        else {
            fatalError("No JSON Data")
        }
        print("JSON Data:", jsonData)
        jsonToModel(jsonData)
    }

    //json的自动解析
    func jsonToModel(_ data: Data) {
        guard let list = try? JSONDecoder().decode(NewsList.self, from: data) else {
            fatalError("No list")
        }
        print("List:", list)
        print()
        
        print("Page:", list.page)
        print("Next:", list.next)
        print("List:", list.list)
        print()
        
        for news in list.list {
            print("Title:", news.title)
            print("Content:", news.content)
            print("Read count:", news.readCount)
            print("Is big:", news.isBig)
            print()
        }
        
        guard let jsonData = try? JSONEncoder().encode(list) else {
            fatalError("NO JSON data")
        }
        print("JSON data:", jsonData)
    }
}

