//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Наталия on 02.10.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    private let user = "Natalia"
    private let password = "1"
   
    
    // MARK: - Navigation
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?) -> Bool {
       let result =
            userNameTextField.text == user &&
            passwordTextField.text == password
            
        if !result {
            showAlert(title: "Wrong user name or password",
                      message: "Enter correct user name and password",
                    textField: passwordTextField)
        }
        return result
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            Session.user = user
        }
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }

    private func showAlert(title: String,
                           message: String,
                           textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
        @IBAction func forgotUserName() {
            showAlert(title: "Oops!", message: "Your name is \(user) 😉")
        }
    @IBAction func forgotPassword() {
        showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
}
