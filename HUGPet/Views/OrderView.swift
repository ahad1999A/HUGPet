//
//  OrderView.swift
//  PackagesInfo
//
//  Created by AlDana Alsowaity on 21/06/2022.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
        VStack{
        Text("You don't have any orders yet 😥!")
                .bold()
                .font(.title2)
                .multilineTextAlignment(.center)
            
        }
        
        .navigationTitle("Order")
        }
    }
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
