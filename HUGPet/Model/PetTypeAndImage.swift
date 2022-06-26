//
//  ModelProfile.swift
//  PageProfile-HugApp
//
//  Created by AMJAD on 25/11/1443 AH.
//

import Foundation
import Firebase
enum PetType: String, CaseIterable {
    case cat
    case dog
    case bird
    case rabbit
    
    var imageName: String {
        switch self {
        case .cat:
            return "person"
        case .dog:
            return "house"
        case .bird:
            return "bell"
        case .rabbit:
            return "envelope"
        }
    }
}
struct Pet: Identifiable{
    
    var id :String = UUID().uuidString
    var image : String
    var title : String
   //var gender: AllGender
    
    
}


var ImagePet = [
    Pet (image: "Cat", title: "Cat"),
    Pet (image: "Dog", title: "Dog"),
    Pet (image: "Rabbit", title: "Rabbit"),
    Pet (image: "Bird", title: "Bird")
]


