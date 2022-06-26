////
////  AddService.swift
////  PackagesInfo
////
////  Created by AlDana Alsowaity on 22/06/2022.
////
//
//import SwiftUI
//
//struct AddServiceView: View {
//  @State var orderinfo : Order
//  @State var selectedDate: Date
//  @State var postComments: String = ""
//    
//    @StateObject var PackageVM = PackageViewModel()
//    var packageData : Package
// 
//    var body: some View {
//        
//    NavigationView{
//        
//    List{
//        
//        Section{
////
////            let packageinfo = Package(name: "x", details: "x", image: "x", packageImage: "x", price:"90")
////
////            OrderView(packageData: packageinfo)
//            
//            
//            
//
//        }
//        
//      Section{
//                DatePicker("التاريخ والوقت" , selection: $selectedDate)
//              .font(.system(size: 15))
//            }
//    header: {
//            Text("اختر الوقت")}
//          .font(.system(size: 17))
//          
//        Section{
//            TextField("كمثال : قطي لديها مخاوف كثيرة", text: $postComments)
//               }header: {
//           Text("اكتب ملاحظتك")}
//        .font(.system(size: 17))
//        
//        
//      Button {
//        savepostandcmments()
//      } label: {
//          HStack{
//              Spacer()
//     Text("التالي")
//              Spacer()
//          }
//      }
//      .disabled(postComments.isEmpty)
//      .padding()
//        
//        
//        
//    }
//   // .listRowInsets(EdgeInsets())
////    .listStyle(.insetGrouped)
//        
//    } .listStyle(.insetGrouped)
//    //.navigationTitle("استحمام مائي")
////      .environment(\.layoutDirection, .rightToLeft)
////        .flipsForRightToLeftLayoutDirection(true)
////        .listStyle(.insetGrouped)
//  }
//  func savepostandcmments(){
////    insidePackage.comments = postComments
////    insidePackage.selectedDate = selectedDate
////
////    print(insidePackage.comments)
////    print(insidePackage.selectedDate
//      
//   orderinfo.selectedDate = selectedDate
//   orderinfo.comments = postComments
//      
// print (orderinfo.selectedDate = selectedDate)
// print (orderinfo.comments = postComments)
//}
//    
//struct AddServices_Previews: PreviewProvider {
//  static var previews: some View {
//      AddServiceView(orderinfo: Order(clinicId: "", driverId: "", customerName: "", orderstats: .yourPetBeenRecived, selectedDate: Date()), selectedDate: Date(), postComments: "", packageData: Package(name: "String", details: "String", image: "String", packageImage: "String", price: "String"))
//  }
//}
//}
