//
//  PackageViewModel.swift
//  PackagesInfo
//
//  Created by AlDana Alsowaity on 19/06/2022.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class PackageViewModel: ObservableObject {
   
    @Published var packages: [Package] = []
    
    init(){
        
        //fetchPackages()
        let db = Firestore.firestore()
        
        db.collection("packages").getDocuments(){ [self] (querySnapshot,error) in
            guard let packagesDetails = querySnapshot else {return}
            
            self.packages = packagesDetails.documents.compactMap({(doc)->Package? in
            _ = doc.documentID
        
            let name = doc.get("name") as! String
            let image = doc.get("image") as! String
            let packageImage = doc.get("packageImage") as! String
            let details = doc.get("details") as! String
                let price = doc.get("price") as! String
            
            return Package(name: name, details: details, image: image, packageImage: packageImage, price: price)
    })
    
            }
    }
    
    
    
}//class







//    func fetchPackages(){
//
//        let db = Firestore.firestore()
//
//    db.collection("packages").getDocuments(){ (querySnapshot,error) in
//        if let error = error{
//
//            print("Error getting documents: \(error)")
//        } else{
//
//            if let querySnapshot = querySnapshot{
//                for document in querySnapshot.documents{
//
//                    let data = document.data()
//
//                    let name = data["name"] as? String ?? ""
//                    let details = data["details"] as? String ?? ""
//                    let image = data["image"] as? String ?? ""
//
//
//                    let packages = Package(name: name, details: details, image: image)
//                    self.packages.append(packages)
//
//                }
//
//            }
//        }
//
//
//        }
//
//
//    }
    
    
//    init() {
//        addPackage()
//    }
//
//    func addPackage() {
//        packages = packageData
//    }
//
//
    
    
//
//}
//
//
//
//
//let packageData = [
//
//    Package(name: "استحمام مائى", details: "تنظيف اذن", image: "PackageImage"),
//    Package(name: "استحمام جاف", details: "تنظيف عين", image: "PackageImage"),
//    Package(name: "استحمام طبي", details: "قص اظافر  ", image: "PackageImage")
//
//
//]
