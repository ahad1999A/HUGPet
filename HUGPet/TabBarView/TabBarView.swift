//
//  TabBarView.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 24/11/1443 AH.
//

import SwiftUI


enum tabPressed{
    case services
    case order
}
struct TabBarView: View {
    
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }
    
    @State var selected : tabPressed = .services
    
    @AppStorage("Onboarding") var Onboarding: Bool = true
    
    var body: some View {
        //        NavigationView{
        TabView(selection: $selected){
            MainView(servicesVM: ServicesViewModel())
            
                .tabItem{
                    Image(systemName: "pawprint.fill")
                    Text("Services")
                }
                .tag(tabPressed.services)
            
            
            OrderView()
                .tabItem{
                    Image(systemName: "bag.fill")
                    Text("Order")
                }
                .tag(tabPressed.order)
            
        }   .sheet(isPresented: $Onboarding) {
            VStack(spacing: 64){
                
                Text("What's Hug?")
                    .font(.system(size: 32, weight: .bold, design: .default))
                
                
                
                
                HStack(spacing: 24){
                    
                    
                    Image(systemName: "scale.3d")
                        .resizable()
                        .frame(width: 60, height: 50, alignment: .trailing)
                        .foregroundColor(Color.accentColor)
                    
                    VStack{
                        HStack{
                            
                            
                            Text("Connect with clinic")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                                .frame(width: 103)
                        }
                        Text("We provide a direct services with vet clinic ")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    
                    
                }.padding()
                
                HStack(spacing: 24){
                    
                    
                    Image(systemName: "rectangle.and.hand.point.up.left.filled")
                        .resizable()
                        .frame(width: 60, height: 50, alignment: .trailing)
                        .foregroundColor(Color.accentColor)
                    
                    VStack{
                        HStack{
                            //                            Spacer()
                            Text("Choose a package")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .multilineTextAlignment(.leading)
                            Spacer()
                                .frame(width: 103)
                        }
                        Text("You can choose one of our packages for your pet")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    
                    
                }.padding()
                
                HStack(spacing: 24){
                    
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .frame(width: 60, height: 50, alignment: .trailing)
                        .foregroundColor(Color.accentColor)
                    
                    
                    VStack{
                        
                        HStack{
                            //                            Spacer()
                            Text("Make an appointment")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                                .frame(width: 103)
                        }
                        Text("One of our services, you can choose the day that suits you to book an appointment with the clinics")
                            .font(.system(size: 12, weight: .regular, design: .default))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    
                    
                }.padding()
                
                
                Button(action: {
                    Onboarding = false
                }, label: {
                    Text("Continue")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 342, height: 50 , alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(16)
                })
            }
            // }
        }
    }
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
