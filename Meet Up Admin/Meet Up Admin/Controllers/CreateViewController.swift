//
//  CreateViewController.swift
//  Meet Up Admin
//
//  Created by Abraham Quezada on 1/10/19.
//  Copyright © 2019 Gerardo Castillo Duran . All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class CreateViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var txtEventTitle: UITextField!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var txtStartDate: UITextField!
    @IBOutlet weak var txtEndDate: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtAvailableTickets: UITextField!
    @IBOutlet weak var txtStartTime: UITextField!
    @IBOutlet weak var txtEndTime: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButton.layer.cornerRadius = 8.0
        createButton.layer.masksToBounds = true
        createButton.isUserInteractionEnabled = false
        createButton.alpha = 0.5
        }
    
    
    @IBAction func titleEvent(_ sender: UITextField) {
        if(txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func startDate(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func endDate(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func countryChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func cityChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func streetChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func priceChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func ticketsChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func startTimeChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func endTimeChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func descriptionChanged(_ sender: UITextField) {
        if(txtEventTitle.text?.isEmpty == false) && (txtStartDate.text?.isEmpty == false) && (txtEndDate.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtStartTime.text?.isEmpty == false) && (txtEndTime.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    
    func buttonDisabled(){
        createButton.isUserInteractionEnabled = false
        createButton.alpha = 0.5
    }
    
    func buttonEnabled(){
        createButton.isUserInteractionEnabled = true
        createButton.alpha = 1.0
    }
    
    
    @IBAction func CreateEvent(_ sender: UIButton) {
       if Auth.auth().currentUser != nil {
        Event.saveEvent(City: "s", Country: "a", Description: "a", EndDate: "a", EndHour: "2", ImageUrl: "2ww1", Place: "ss", Name: "dwed", Price: "wzw", StartDate: "wwxw", StartHour: "ededed", Street: "ededed") { (succes,key)  in
                if succes {
                    let tickets = Ticket.generateTickets(number: Int(self.txtAvailableTickets.text!)!)
                    Event.saveEventAdmin(City: "s", Country: "a", Description: "a", EndDate: "a", EndHour: "2", ImageUrl: "2ww1", Place: "ss", Name: "dwed", Price: "wzw", StartDate: "wwxw", StartHour: "ededed", Street: "ededed", key: key, Tickets: tickets, completion: { (sucess2) in
                        if sucess2{
                            Event.saveEventTickets(key: key, Tickets: tickets, completion: { (sucess3) in
                                if sucess3{
                                    print("Ya chingamos")
                                }
                            })
                        }else{
                            print("Error eventosAdmin")
                        }
                    })
                }else{
                    print("ErrorEventos")
                }
            }
            
        }else{
            
            performSegue(withIdentifier: "eventToLog", sender: nil)
            
        }
    }
    
    
    @IBAction func uploadImage(_ sender: UITapGestureRecognizer) {
        
        CreateViewController().pickImage(self){ image in
            self.imgEvent.image = image
        }
    }
    
    
    
    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: .default){
            UIAlertAction in
            self.openGallery()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = self.viewController!.view
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            
            let alertWarning = UIAlertController(title:"Warning" , message: "You don't have camera", preferredStyle: .alert)
            self.present(alertWarning, animated: true)
        }
    }
    func openGallery(){
        alert.dismiss(animated: true, completion: nil)
        picker.sourceType = .photoLibrary
        self.viewController!.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    // For Swift 4.2
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickImageCallback?(image)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }

    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
      //   guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        guard let imageData = UIImage.jpegQ(.medium) else {return}
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                if let url = metaData?.downloadURL() {
                    completion(url)
                } else {
                    completion(nil)
                }
                // success!
            } else {
                // failed
                completion(nil)
            }
        }
    }
}


extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    func jpegQ(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
