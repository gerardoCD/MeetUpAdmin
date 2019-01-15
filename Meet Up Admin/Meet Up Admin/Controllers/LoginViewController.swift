//
//  LoginViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/12/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInButton.layer.cornerRadius = 8.0
        signInButton.layer.masksToBounds = true
        signInButton.isUserInteractionEnabled = false
        signInButton.alpha = 0.5
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        if(txtPassword.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        if(txtEmail.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    func buttonDisabled(){
        signInButton.isUserInteractionEnabled = false
        signInButton.alpha = 0.5
    }
    
    func buttonEnabled(){
        signInButton.isUserInteractionEnabled = true
        signInButton.alpha = 1.0
    }
    
    
    @IBAction func SignUp(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            if user != nil {
                // Pasa ventana
                //alerta "©
                let alert = UIAlertController(title: "Congratulations", message: "You are logged", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(alert: UIAlertAction!) in  self.navigationController?.popToRootViewController(animated: true)}))
                self.present(alert, animated: true)
                
                
            }else{
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .emailAlreadyInUse:
                        let alert = UIAlertController(title: "Error", message: "Your email is In Use", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .invalidEmail:
                        let alert = UIAlertController(title: "Error", message: "Your format email is incorrect", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .userDisabled:
                        let alert = UIAlertController(title: "Error", message: "Your user has been disable \n Try contact us", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .wrongPassword:
                        let alert = UIAlertController(title: "Error", message: "Your datas are incorrects", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .weakPassword:
                        let alert = UIAlertController(title: "Error", message: "Your datas are incorrects", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .userNotFound:
                        let alert = UIAlertController(title: "Error", message: "Your datas are incorrects", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    case .networkError:
                        let alert = UIAlertController(title: "Error", message: "You are not connect on Internet", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    default:
                        let alert = UIAlertController(title: "Error", message: "You have a error \n Try Try contact us", preferredStyle: .alert )
                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                        self.present(alert, animated: true)
                    }
                }
                
                
                
            }
        }
    }
    
    

}
