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
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtAvailableTickets: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var txtPlace: UITextField!
    
    
    
    
    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage) -> ())?;
    var url: String? = nil
    var startDateSend = ""
    var startTimeSend = ""
    var endDateSend = ""
    var endTimeSend = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgEvent.image = UIImage(named: "defaultImage")
        createButton.layer.cornerRadius = 8.0
        createButton.layer.masksToBounds = true
        createButton.isUserInteractionEnabled = false
        createButton.alpha = 0.5
        
        startDatePicker?.datePickerMode = .dateAndTime
        startDatePicker?.minimumDate = Date.calculateDate(day: 1, month: 2, year: 2019, hour: 0, minute: 0)
        startDatePicker?.maximumDate = Date.calculateDate(day: 31, month: 12, year: 2019, hour: 0, minute: 0)
        endDatePicker?.datePickerMode = .dateAndTime
        endDatePicker?.minimumDate = Date.calculateDate(day: 1, month: 2, year: 2019, hour: 1, minute: 0)
        startDatePicker?.maximumDate = Date.calculateDate(day: 31, month: 12, year: 2019, hour: 1, minute: 0)
        }
    
    
    
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        startDateLabel.text = "Day: \(sender.date.getDayMonthYearHourMinuteSecond().day) Month: \(sender.date.getDayMonthYearHourMinuteSecond().month) Year: \(sender.date.getDayMonthYearHourMinuteSecond().year)"
        
         startTimeLabel.text = "Hour: \(sender.date.getDayMonthYearHourMinuteSecond().hour) Minute: \(sender.date.getDayMonthYearHourMinuteSecond().minute) Second: \(sender.date.getDayMonthYearHourMinuteSecond().second)"
        
        startDateSend = "\(sender.date.getDayMonthYearHourMinuteSecond().day)/\(sender.date.getDayMonthYearHourMinuteSecond().month)/\(sender.date.getDayMonthYearHourMinuteSecond().year)"
        
        startTimeSend = "\(sender.date.getDayMonthYearHourMinuteSecond().hour):\(sender.date.getDayMonthYearHourMinuteSecond().minute):\(sender.date.getDayMonthYearHourMinuteSecond().second)"
    }
    
    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        endDateLabel.text = "Day: \(sender.date.getDayMonthYearHourMinuteSecond().day) Month: \(sender.date.getDayMonthYearHourMinuteSecond().month) Year: \(sender.date.getDayMonthYearHourMinuteSecond().year)"
        
        endTimeLabel.text = "Hour: \(sender.date.getDayMonthYearHourMinuteSecond().hour) Minute: \(sender.date.getDayMonthYearHourMinuteSecond().minute) Second: \(sender.date.getDayMonthYearHourMinuteSecond().second)"
        
        endDateSend = "\(sender.date.getDayMonthYearHourMinuteSecond().day)/\(sender.date.getDayMonthYearHourMinuteSecond().month)/\(sender.date.getDayMonthYearHourMinuteSecond().year)"
        
        endTimeSend = "\(sender.date.getDayMonthYearHourMinuteSecond().hour):\(sender.date.getDayMonthYearHourMinuteSecond().minute):\(sender.date.getDayMonthYearHourMinuteSecond().second)"
    }
    
    //IMPORTANTE CON ESTE CODIGO OBTIENES EL VALOR DE LA FECHA Y LA HORA 
//    @IBAction func pressButton(_ sender: UIButton) {
//        let startDate = startDateSend
//        let startTime = startTimeSend
//        let endDate = endDateSend
//        let endTime = endTimeSend
//        print(startDate)
//        print(startTime)
//        print(endDate)
//        print(endTime)
//    }
    
    
    @IBAction func titleEvent(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func placeNameChanged(_ sender: UITextField) {
        if(txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func countryChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func cityChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func streetChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func priceChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func ticketsChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtDescription.text?.isEmpty == false){
            if sender.text?.isEmpty == true{
                buttonDisabled()
            }else{
                buttonEnabled()
            }
        }
    }
    @IBAction func descriptionChanged(_ sender: UITextField) {
        if(txtPlace.text?.isEmpty == false) && (txtEventTitle.text?.isEmpty == false) && (txtCountry.text?.isEmpty == false) && (txtCity.text?.isEmpty == false) && (txtStreet.text?.isEmpty == false) && (txtPrice.text?.isEmpty == false) && (txtAvailableTickets.text?.isEmpty == false){
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
       
      //  print(url!)
       if Auth.auth().currentUser != nil {
        uploadProfileImage(imgEvent.image!) { (urlAux) in
            self.url = urlAux
            Event.saveEvent(City: self.txtCity.text ?? "", Country: self.txtCountry.text ?? "", Description: self.txtDescription.text ?? "", EndDate: self.endDateSend, EndHour: self.endTimeSend, ImageUrl: self.url ?? "", Place: self.txtPlace.text ?? "", Name: self.txtEventTitle.text ?? "", Price: Double(self.txtPrice.text ?? "0.0")! , StartDate: self.startDateSend, StartHour: self.startTimeSend, Street: self.txtStreet.text ?? "") { (succes,key)  in
                if succes {
                    let tickets = Ticket.generateTickets(number: Int(self.txtAvailableTickets.text!)!)
                    Event.saveEventAdmin(City: "s", Country: "a", Description: "a", EndDate: "a", EndHour: "2", ImageUrl: "2ww1", Place: "ss", Name: "dwed", Price: Double(self.txtPrice.text ?? "0.0")!, StartDate: "wwxw", StartHour: "ededed", Street: "ededed", key: key, Tickets: tickets, completion: { (sucess2) in
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
        let gallaryAction = UIAlertAction(title: "Gallery", style: .default){
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

    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:String?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("\(uid)"+"\(Int.random(in: 0 ... 99999999999999))")

        
     
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {return}
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
             storageRef.downloadURL(completion: { (url, error) in
                  completion(url?.absoluteString)
                })
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
