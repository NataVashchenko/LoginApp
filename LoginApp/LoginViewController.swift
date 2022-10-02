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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }

    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       let result = userNameTextField.text == "1" && passwordTextField.text == "1"
        if !result {
            let alert = UIAlertController(title: "Wrong user name or password", message: "Enter correct user name and password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel))
            present(alert, animated: true)
        }
        return result
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let userName = userNameTextField.text ?? ""
        let welcomeViewController = segue.destination as! WelcomeViewController
        welcomeViewController.title = "Welcome, \(userName)"
        
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
}
