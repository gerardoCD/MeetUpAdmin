//
//  SignUpViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/12/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpButton.layer.cornerRadius = 8.0
        signUpButton.layer.masksToBounds = true
    }
    
    @IBAction func SignUP(_ sender: UIButton) {
        
        if txtPassword.text == txtConfirmPassword.text{
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (authResult, error) in
                if error == nil {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = self.txtName.text
                    changeRequest?.commitChanges { error in
                        if error == nil {
                            //Alert
                            self.saveProfile(userName: self.txtName.text!,userEmail:self.txtEmail.text!) { success in
                                if success {
                                    let alert = UIAlertController(title: "Congratulations", message: "You are Singed", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(alert: UIAlertAction!) in  self.navigationController?.popToRootViewController(animated: true)}))
                                    self.present(alert, animated: true)
                                    
                                }
                                
                            }
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Your datas are incorrects", preferredStyle: .alert )
                            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
                            self.present(alert, animated: true)
                        }
                    }
                } else {
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
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Your passwords are not equals", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:nil))
            self.present(alert, animated: true)
        }
        
    }
    
    
    func saveProfile(userName:String,userEmail:String, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let databaseRef = Database.database().reference().child("usersAdmin/profile/\(uid)")
        
        let userObject = [
            "email": userEmail,
            "username": userName,
            ] as [String:Any]
        
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
    }
    
    

}
