//
//  PackageModel.swift
//  PackagesInfo
//
//  Created by AlDana Alsowaity on 19/06/2022.
//

import Foundation
import SwiftUI


struct Package: Identifiable {
    var id = UUID()
    var name: String
    var details: String
    var image: String
    var packageImage: String
    var price: String
   
    
}


