//
//  PetInfo.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 26/11/1443 AH.
//

import Foundation

struct PetInfo : Identifiable,Equatable,Codable{
    
    var id :String = UUID().uuidString
    var PetName : String
    var GenderPets : AllGender
    var BirthDayPets : Date
    var heightPet : Int
    var WeightPet : Int
    var TypePets : String
}
enum AllGender : String , Codable{
    
    case male
    case female
}
