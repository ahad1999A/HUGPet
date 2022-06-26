//
//  Details.swift
//  PackagesInfo
//
//  Created by AlDana Alsowaity on 23/06/2022.
//

import SwiftUI

struct PackageDetalis: View {
    
    @State var orderinfo : Order
    @State var selectedDate: Date
    @State var postComments: String = ""
    
    
    var package:Package
    
    var body: some View {
      
        ScrollView{
        
        VStack(alignment: .trailing) {
           
            Text(package.name)
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment: .trailing) {
                
                Text("Package Detalis")
                    .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
                
               
                                   //Spacer() Spacer()
                    Text(package.details)
                        .fontWeight(.bold)
                        .frame(width: 330, height: 50)
                        .padding(.trailing)
                   // Spacer()
               
           
               
                
                HStack {
                    
                    Text(package.price)
                        .foregroundColor(.accentColor)
                    Image("cash icon")
                    Spacer()
                }
                .padding()
                
                
            }.frame(width: 358, height: 162)
                .background(Color("BackgroundGray"))
                .cornerRadius(12)
                
            
            
          
            Text("Choose a Date")
                .font(.subheadline)
                .foregroundColor(Color.gray)
           
            
            DatePicker("Date and Time" , selection: $selectedDate)
                .padding()
          .frame(width: 358, height: 50)
          .background(Color("BackgroundGray"))
          .cornerRadius(12)
        
            
            Text("Extra Detalis")
                .font(.subheadline)
                .foregroundColor(Color.gray)
            
            TextField("For Example: My cat is allergic to...", text: $postComments)
                .padding()
          .frame(width: 356, height: 79)
          .background(Color("BackgroundGray"))
          .cornerRadius((12))
        
            
            
            
        
            Button {
              savepostandcmments()
            } label: {
                HStack{
                    Spacer()
           Text("Continue")
                    Spacer()
                }
            }
            .frame(width: 324, height: 52)
            .background(Color("BackgroundGray"))
            .cornerRadius(16)
            .disabled(postComments.isEmpty)
            .padding()
        
        
            Spacer()
            Spacer()
        
        
        }
        .padding()
    
    }//scroll
    
     
       
    
    }
    
    
  
    
    
    func savepostandcmments(){
 
        orderinfo.selectedDate = selectedDate
        orderinfo.comments = postComments
        
        //print(orderinfo.selectedDate)
       // print(orderinfo.comments)
  }
    
    
    
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        
        let package = Package(name: "water shower", details: "full pack", image: "dog", packageImage: "bg", price: "89")
        
        let order = Order(clinicId: "", driverId: "", customerName: "", orderstats: .yourPetBeenRecived, comments: "", selectedDate: Date())
        
        PackageDetalis(orderinfo: order, selectedDate: Date(), postComments:"", package: package)
    }
}
