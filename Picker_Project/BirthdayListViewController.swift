//
//  BirthdayListViewController.swift
//  Picker_Project
//
//  Created by user on 01.05.2022.
//

import UIKit

protocol DelegateFriend {
    func addFriend(name:String, age:String, instagram:String, image:UIImage)
}

class BirthdayListViewController: UIViewController, DelegateFriend {
    
    
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageFriend.layer.cornerRadius = imageFriend.frame.size.width / 2
    }
    
    func addFriend(name: String, age: String, instagram: String, image:UIImage) {
        nameLabel.text = name
        ageLabel.text = "\(age)" + " \(instagram)"
        imageFriend.image = image
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddFriendsViewController else {return}
        destination.delegate = self
    }

}
