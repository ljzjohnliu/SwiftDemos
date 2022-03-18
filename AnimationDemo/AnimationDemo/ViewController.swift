//
//  ViewController.swift
//  AnimationDemo
//
//  Created by ByteDance on 2022/3/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameLabel = createLabel(y: 100, text: "FrameLabel")
        let centerLabel = createLabel(y: frameLabel.frame.maxY + 20, text: "CenterLabel")
        let transformLabel = createLabel(y: centerLabel.frame.maxY + 20, text: "TransformLabel")
    }

    private func createLabel(y: CGFloat, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: y, width: 200, height: 100))
        label.backgroundColor = .systemGray3
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.text = text
        view.addSubview(label)
        return label
    }
}

