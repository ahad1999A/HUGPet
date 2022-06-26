import Foundation
import SwiftUI
import FirebaseFirestore



class ServicesViewModel: ObservableObject{
    
    @Published var servicesDetalis = [Services]()
    //    @Published var petDetalis = [Pet]()
    
    
    init(){
        let db = Firestore.firestore()
        // var counter = -1
        db.collection("Services").getDocuments { [self] (snap,error) in
            guard let ServicesImages = snap else {return}
            self.servicesDetalis = ServicesImages.documents.compactMap({(doc) -> Services? in
                _ = doc.documentID
                
                let images = doc.get("serviceImage") as! String
                let name = doc.get("name") as! String
                let descriotion = doc.get("description") as! String
                let backgroundPackage = doc.get("backgroundPackage") as! String
                let pacakgeTypeOne = doc.get("PackageOne") as! String
                let packageTypeTwo = doc.get("PackageTwo") as! String
                
                let pacakgeTypeThree = doc.get("PackageThree") as! String
                let packageDescription = doc.get("descriptionPackage") as! String
                
                let packagePet = doc.get("packagePet") as! String
//                let pacakgeTypeFour = doc.get("PackageFour") as! String
                
                var service: Services {
                    switch name {
                    case "Shower":
                        // counter += 1
                        return Services(service: .showerService , kindOfService: .Grooming1 , KindsOfPet: [.Dog, .Rabbit, .Cat],
                                        servicesImage: images, name: name, description: descriotion, BackgroundPackage: backgroundPackage , packageOne: pacakgeTypeOne , packageTwo: packageTypeTwo , packageThree: pacakgeTypeThree, packageDescription: packageDescription, packagePet: packagePet)
                    case "Grooming":
                        return Services(service: .showerService , kindOfService: .Grooming1 , KindsOfPet: [.Dog, .Rabbit, .Cat, .Bird],
                                        servicesImage: images, name: name, description: descriotion, BackgroundPackage: backgroundPackage , packageOne: pacakgeTypeOne , packageTwo: packageTypeTwo , packageThree: pacakgeTypeThree, packageDescription: packageDescription, packagePet: packagePet)
                    case "Vaccination":
                        return Services(service: .showerService , kindOfService: .Grooming1 , KindsOfPet: [.Dog, .Cat],
                                        servicesImage: images, name: name, description: descriotion, BackgroundPackage: backgroundPackage , packageOne: pacakgeTypeOne , packageTwo: packageTypeTwo , packageThree: pacakgeTypeThree, packageDescription: packageDescription, packagePet: packagePet)
                    case "Castration":
                        return Services(service:.showerService , kindOfService: .Grooming1 , KindsOfPet: [.Cat, .Dog],
                                        servicesImage: images, name: name, description: descriotion, BackgroundPackage: backgroundPackage , packageOne: pacakgeTypeOne , packageTwo: packageTypeTwo , packageThree: pacakgeTypeThree, packageDescription: packageDescription, packagePet: packagePet)
                    default:
                        return Services(service: .showerService , kindOfService: .Grooming1 , KindsOfPet: [.Dog, .Cat],
                                        servicesImage: images, name: name, description: descriotion, BackgroundPackage: backgroundPackage , packageOne: pacakgeTypeOne , packageTwo: packageTypeTwo , packageThree: pacakgeTypeThree, packageDescription: packageDescription, packagePet: packagePet)
                    }
                }
                return service
            })
        }
    }
}
