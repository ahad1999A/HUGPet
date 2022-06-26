//
//  Order.swift
//  PackagesInfo
//
//  Created by AlDana Alsowaity on 22/06/2022.
//

import Foundation


struct Order: Identifiable, Codable {
 
  var id: String = UUID().uuidString
  let clinicId: String
  let driverId: String
  let customerName: String
  var orderstats: proessingOrder
  var comments: String = "" // PRINT
  var selectedDate: Date // PRINT
    
}

class orderInfo: Identifiable , ObservableObject{

    
  @Published var orderinfo = [Order]()
    
    
}


enum proessingOrder: String , Identifiable , CaseIterable ,Codable{
  var id: UUID{
    return UUID()
  }
  case yourPetBeenRecived
  case onTheWayToClinic
  case yourPetHasDeliveredToClinic
  case yourPetIsOutToDelivery
  case yourOrderHasBeenDeliveredToYou
  var title: String{
    switch self {
    case .yourPetBeenRecived:
      return "Your Pet Been Recived"
    case .onTheWayToClinic:
      return "On The Way To Clinic"
    case .yourPetHasDeliveredToClinic:
      return "Your Pet Has Been Deliverd To Clinic"
    case .yourPetIsOutToDelivery:
      return "Your Pet Is Out To Delivery"
    case .yourOrderHasBeenDeliveredToYou:
      return "Your Order Has Been Delivered To You"
    }
  }
}
