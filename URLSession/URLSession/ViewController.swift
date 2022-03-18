//
//  ViewController.swift
//  URLSession
//
//  Created by ByteDance on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {

    private var label: UILabel!
    private var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.backgroundColor = .systemGray5
        vStack.axis = .vertical
        view.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor),
            vStack.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.numberOfLines = 0
//        label.text = "这里展示网络请求结果"
        vStack.addArrangedSubview(label)
        
        button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitleColor(button.tintColor, for: .normal)
        button.setTitle("Send", for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        vStack.addArrangedSubview(button)
    }

    @objc private func clickButton() {
        print(#function)
        let url = URL(string: "https://github.com/ljzjohnliu/SwiftDemos/blob/main/JSON/JSON/NewsList.json")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // GET POST PUT DELETED
        request.addValue("", forHTTPHeaderField: "Token")
        let dic = ["page": 1]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: [])
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.updateText(error.localizedDescription)
                return
            }
            guard let response = response as? HTTPURLResponse,
                response.statusCode >= 200,
                response.statusCode < 300
            else {
                self.updateText("Invalid response")
                return
            }
            guard let data = data else {
                self.updateText("No data")
                return
            }
            self.updateText("Get data count: \(data.count)")
            guard let list = try? JSONDecoder().decode(NewsList.self, from: data) else {
                self.updateText("No list")
                return
            }
            self.updateText(list.displayText)
        }
        task.resume()
    }
    
    private func updateText(_ text: String) {
        DispatchQueue.main.async {
            self.label.text = text
        }
    }
}

