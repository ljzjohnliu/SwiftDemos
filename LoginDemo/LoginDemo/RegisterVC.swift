//
//  RegisterVC.swift
//  LoginDemo
//
//  Created by ByteDance on 2022/3/15.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func clickLoginButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //写法1
//        if segue.identifier == "success" ,
//           let destination = segue.destination as? SuccessVC {
//                destination.text = "注册成功"
//        }
        
        //写法2
        guard segue.identifier == "success" ,
           let destination = segue.destination as? SuccessVC
        else { return }
        
        destination.text = "注册成功"
        destination.username = usernameTextField.text ?? ""
        destination.password = pwdTextField.text ?? ""
        usernameTextField.text = nil
        pwdTextField.text = nil
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(#function)
        if identifier == "success" {
            let username = usernameTextField.text ?? ""
            if username.isEmpty || username.count < 6 {
                errorLabel.text = "请输入用户名,长度大于6才可以"
                return false
            }
            
            let password = pwdTextField.text ?? ""
            if password.isEmpty || username.count < 6 {
                errorLabel.text = "请输入密码,长度大于6才可以"
                return false
            }
            
            errorLabel.text = nil
        }
        return true
    }

}
