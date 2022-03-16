//
//  SuccessVC.swift
//  LoginDemo
//
//  Created by ByteDance on 2022/3/15.
//

import UIKit

class SuccessVC: UIViewController {
    
    var text: String = ""
    var username: String = ""
    var password: String = ""

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var infoLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = text
        infoLable.text = username + ":" + password
    }
    
    @IBAction func clickExitButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
