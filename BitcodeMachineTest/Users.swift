//
//  Users.swift
//  BitcodeMachineTest
//
//  Created by Mac on 19/01/24.
//

import Foundation
struct Users{
    var address : Address
    var username : String
    var email : String
    var name : Name
}
struct Address{
    var geolocation : Geolocation
    var city : String
    var street : String
    var number : Int
    var zipcode : String
}
struct Geolocation{
    var lat : String
    var long : String
}
struct Name {
    var firstname : String
    var lastname : String
}
