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
class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var meetImage: UIImageView!
    @IBOutlet weak var joinUsImage: UIImageView!
    @IBOutlet weak var Scroll: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        signUpButton.layer.cornerRadius = 8.0
        signUpButton.layer.masksToBounds = true
        signUpButton.isUserInteractionEnabled = false
        signUpButton.alpha = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        joinUsImage.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.5, delay: 0.3, options: [], animations:{
            self.joinUsImage.center.x += self.view.bounds.width/2.5
        },
                       completion: nil
        )
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Scroll.setContentOffset((CGPoint(x: 0, y: 170)), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        Scroll.setContentOffset((CGPoint(x: 0, y: 0)), animated: true)
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        if(txtName.text?.isEmpty == false) && (txtPassword.text?.isEmpty == false) && (txtConfirmPassword.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    @IBAction func usernameChanged(_ sender: UITextField) {
        if(txtEmail.text?.isEmpty == false) && (txtPassword.text?.isEmpty == false) && (txtConfirmPassword.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        if(txtEmail.text?.isEmpty == false) && (txtName.text?.isEmpty == false) && (txtConfirmPassword.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    @IBAction func confirmPassword(_ sender: UITextField) {
        if(txtEmail.text?.isEmpty == false) && (txtName.text?.isEmpty == false) && (txtPassword.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    func buttonDisabled(){
        signUpButton.isUserInteractionEnabled = false
        signUpButton.alpha = 0.5
    }
    
    func buttonEnabled(){
        signUpButton.isUserInteractionEnabled = true
        signUpButton.alpha = 1.0
    }
    
    
    @IBAction func SignUP(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut, .autoreverse], animations:{
            self.meetImage.transform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
            self.meetImage.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            
        },
                       completion: nil
        )
        
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
