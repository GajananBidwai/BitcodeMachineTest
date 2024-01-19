//
//  UserDetailsViewController.swift
//  BitcodeMachineTest
//
//  Created by Mac on 19/01/24.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var userContainer : Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()

    }
    func fetchdata(){
        self.latLabel.text = userContainer?.address.geolocation.lat.description.codingKey.stringValue
        self.longLabel.text = userContainer?.address.geolocation.long.description.codingKey.stringValue
        self.cityLabel.text = userContainer?.address.city.description.codingKey.stringValue
        self.streetLabel.text = userContainer?.address.street.description.codingKey.stringValue
        self.numberLabel.text = userContainer?.address.number.description.codingKey.stringValue
        self.zipcodeLabel.text = userContainer?.address.zipcode.description.codingKey.stringValue
    }
    

    
}
