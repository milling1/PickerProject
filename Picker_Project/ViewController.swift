//
//  ViewController.swift
//  Picker_Project
//
//  Created by user on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var faceIdSwitch: UISwitch!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Создаем рамку у лэйбла
        birthdayLabel.layer.borderWidth = 1.0
        birthdayLabel.layer.borderColor = UIColor.black.cgColor
        
        //Скрываем клавиатуру
        LoginTextField.addTarget(nil, action: #selector(textFieldShouldReturn(textField:)), for: .editingDidEndOnExit)
        
        passwordTextField.addTarget(nil, action: #selector(textFieldShouldReturn(textField:)), for: .editingDidEndOnExit)
       
//        self.LoginTextField.delegate = self
//        self.passwordTextField.delegate = self
        
        
        faceIdSwitch.isOn = false
        
    }
    
    @IBAction func faceIdEnter(_ sender: UISwitch) {
        if faceIdSwitch.isOn {
        performSegue(withIdentifier: "GoToBirthdayList", sender: nil)
        }
//        let storybord:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let birtdayListNewController = storybord.instantiateViewController(withIdentifier: "BirthdayListViewController") as! BirthdayListViewController
//        self.present(birtdayListNewController, animated: true, completion: nil)
    }
    
    
    @IBAction func enterButton(_ sender: UIButton) {
        alertSignIn()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let login = LoginTextField.text,
              let password = passwordTextField.text else{return false}
        if login == "admin" && password == "qwer" {
            return true
        }else {
            return false
        }
    }
    
    func alertSignIn ()  {
        let login = LoginTextField.text
        let password = passwordTextField.text
        
        if login != "admin" && password != "qwer" {
        let alert = UIAlertController(title: "Login or Password is available", message: "Please try again", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    //Кнопка с глазом
    @IBAction func showPassword(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry == false {
            passwordTextField.isSecureTextEntry = true
        } else {
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    
    //Скрывает клавиатуру при нажатие на return
    @objc func textFieldShouldReturn (textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Скрывает клавиатуру при нажатие на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

