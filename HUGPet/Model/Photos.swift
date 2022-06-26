//
//  Photos.swift
//  HUGPet
//
//  Created by ABRAR on 24/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Photos : Codable , Hashable{
    @DocumentID var id: String?
    let url: String
}
