//
//  AddFriendsViewController.swift
//  Picker_Project
//
//  Created by user on 01.05.2022.
//

import UIKit

class AddFriendsViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var sexText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var instagramText: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saveData: UIBarButtonItem!
    @IBOutlet weak var changeImageButton: UIButton!
    
    
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    let genders = ["Masculine", "Femenine"]
//    let photoArray = ["CHIP Small", "Zipper Small"]
//    var immages = UIImage()
    
    
    var delegate:DelegateFriend?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Настройка пикеров
        agePicker.dataSource = self
        agePicker.delegate = self
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        //Привязка пикеров к тексфильдам
        dateText.inputView = datePicker
        sexText.inputView = genderPicker
        ageText.inputView = agePicker
        
        //Нумеротация пикеров
        agePicker.tag = 1
        genderPicker.tag = 2
        
        //Добавление таргета для слежения изменении дат пикера
        datePicker.addTarget(self, action: #selector(datePickerChange(sender:)), for: .valueChanged)
        
        //Отключение по жесту
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        view.addGestureRecognizer(tapGesture)
        
        //Алерт для инсты
        instagramText.addTarget(self, action: #selector(instagramAlert), for: .allTouchEvents)
      
        //Настройка картинки
        image.image = UIImage()
        image.layer.cornerRadius = image.frame.size.width / 2

    }
    
    @objc func datePickerChange(sender: UIDatePicker) {
        getDateFromPicker()
    }
    
    func getDateFromPicker () {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"
        dateText.text = formatter.string(from: datePicker.date)
    }
    
    @objc func tapGestureDone () {
        view.endEditing(true)
    }
    
   
    @objc func instagramAlert() {
        let alert = UIAlertController(title: "Instagram", message: "Please enter your profile", preferredStyle: .alert)
        let action = UIAlertAction(title: "Enter", style: .cancel) { action in
            let textAction = alert.textFields?.first?.text
            self.instagramText.text! = textAction!
        }
        alert.addTextField(configurationHandler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
//    @IBAction func changeImageAction(_ sender: UIButton) {
//        image.image = immages[
//    }
    

    @IBAction func addNewFriend(_ sender: UIBarButtonItem) {
        delegate?.addFriend(name: nameText.text!, age: ageText.text!, instagram: instagramText.text!, image: image.image!)
        navigationController?.popViewController(animated: true)
    }
}


extension AddFriendsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 100
        case 2:
           return genders.count
        default:
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return String(row)
        case 2:
            return genders[row]
        default:
            return "Other gender"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageText.text = String(row)
            ageText.resignFirstResponder()
        case 2:
            sexText.text = genders[row]
            sexText.resignFirstResponder()
        default:
            return 
        }
    }
    
}
