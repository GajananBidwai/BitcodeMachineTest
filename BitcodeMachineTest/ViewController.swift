//
//  ViewController.swift
//  BitcodeMachineTest
//
//  Created by Mac on 19/01/24.
//

import UIKit

class UserViewController: UIViewController {

    var users : [Users] = []
    
    @IBOutlet weak var userTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromApi()
        registerXIBWithTableView()
        initializaTabLeView()
    }
    func fetchDataFromApi(){
        let userUrl = URL(string: "https://fakestoreapi.com/users")
        var userUrlRequest = URLRequest(url: userUrl!)
        userUrlRequest.httpMethod = "GET"
        let userUrlSession = URLSession(configuration: .default)
        let userDatatask = userUrlSession.dataTask(with: userUrlRequest) { userData, userResponse, userError in
            let userResponse = try! JSONSerialization.jsonObject(with: userData!) as! [[String : Any]]
            
            for eachResponse in userResponse{
                let userDictionary = eachResponse as! [String : Any]
                let userAdrress = userDictionary["address"] as! [String : Any]
                let userGeoLocation = userAdrress["geolocation"] as! [String : Any]
                let userCity = userAdrress["city"] as! String
                let userStreet = userAdrress["street"] as! String
                let userNumber = userAdrress["number"] as! Int
                let userZipcode = userAdrress["zipcode"] as! String
                let userLat = userGeoLocation["lat"] as! String
                let userLong = userGeoLocation["long"] as! String
                let userEmail = userDictionary["email"] as! String
                let userUserName = userDictionary["username"] as! String
                let userName = userDictionary["name"] as! [String : Any]
                let userFirstName = userName["firstname"] as! String
                let userLastName = userName["lastname"] as! String
                
                
                let geoLocationObject = Geolocation(lat: userLat, long: userLong)
                let nameObject = Name(firstname: userFirstName, lastname: userLastName)
                
                let addressObject = Address(geolocation: geoLocationObject, city: userCity, street: userStreet, number: userNumber, zipcode: userZipcode)
                
                
               let userObject = Users(address: addressObject, username: userUserName, email: userEmail, name: nameObject)
                
                self.users.append(userObject)
                
                print(self.users)
                
                
             }
            DispatchQueue.main.async {
                self.userTabelView.reloadData()
            }
            
        }
        userDatatask.resume()
    }
    func initializaTabLeView(){
        userTabelView.dataSource = self
        userTabelView.delegate = self
    }
    func registerXIBWithTableView(){
        let uinib = UINib(nibName: "UserTableViewCell", bundle: nil)
        userTabelView.register(uinib, forCellReuseIdentifier: "UserTableViewCell")
    }


}
extension UserViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        
        userDetailsViewController.userContainer = users[indexPath.row]
        
        navigationController?.pushViewController(userDetailsViewController, animated: true)
    }
}
extension UserViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userTableViewCell = self.userTabelView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        userTableViewCell.firstNameLabel.text = users[indexPath.row].name.firstname.description.codingKey.stringValue
        userTableViewCell.lastNameLabel.text = users[indexPath.row].name.lastname.description.codingKey.stringValue
        userTableViewCell.userNameLabel.text = users[indexPath.row].username.codingKey.stringValue
        
        return userTableViewCell
    }
}

