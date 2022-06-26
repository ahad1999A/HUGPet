//
//  MainView.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 24/11/1443 AH.
//

import SwiftUI

struct MainView: View {
    @State var SerahingFor = ""
    @State var selectedPet: PetTypes = .Dog
    @StateObject var servicesVM = ServicesViewModel()
    @State var selectService : ServicesCategory = .showerService
    @State var SearchingFor = ""
    @StateObject var Moodel = PetViewModel()

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        
                        Text("How can we help you?")
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                    }.padding()
                    HStack{
                        ForEach(PetTypes.allCases){ petType in
                            
                            Button(action: {
                                selectedPet = petType
                            }) {
                                VStack{
                                    Spacer()
                                    
                                    Image(petType.rawValue)
                                        .renderingMode(.template)
                                        .frame(maxWidth: 83 , maxHeight: 83)
                                        .foregroundColor(selectedPet == petType ? Color("BackgroundGray") : Color("petSelected"))
                                    
                                    
                                    Text(petType.id)
                                        .font(.system(size: 12, weight: .semibold, design: .default))
                                    
                                        .foregroundColor(selectedPet == petType ? Color("BackgroundGray") : Color("petSelected"))
                                }
                                .background(selectedPet == petType ? Color.accentColor : Color("BackgroundGray"))
                                .cornerRadius(8)
                            }
                            
                        }
                    }
                    Spacer()
                    
                    HStack{
                        Text("Our Services")
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(width: 260)
                        
                    }
                    ForEach(servicesVM.servicesDetalis.filter{$0.KindsOfPet.contains(where: {$0 == selectedPet})}) { ServicesTypes in
                        Spacer()
                        Spacer()
                        
                        NavigationLink() {
                            VStack{
                                ZStack{
                                    
                                    AsyncImage(url: URL(string: ServicesTypes.BackgroundPackage) , transaction: .init(animation: .spring(response: 0.6))) { backgroundImage in
                                        switch backgroundImage {
                                        case .empty:
                                            ProgressView()
                                            
                                        case .success(let backgroundImage):
                                            backgroundImage.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: .infinity, maxHeight: 160)
                                        case .failure(_):
                                            Image(systemName: "photo")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }.padding()
                                    
                                    HStack{
                                        Spacer()
                                        Spacer()
                                        AsyncImage(url: URL(string: ServicesTypes.packagePet) , transaction: .init(animation: .spring(response: 0.6))) { packagePetImage in
                                            switch packagePetImage {
                                            case .empty:
                                                ProgressView()
                                                
                                            case .success(let packagePetImage):
                                                packagePetImage.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 130, height: 140)
                                            case .failure(_):
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        
                                        VStack(alignment: .leading , spacing: 8){
                                            
                                            
                                            Text(ServicesTypes.packageOne)
                                                .font(.system(size: 22, weight: .semibold, design: .default))
                                            
                                            Text(ServicesTypes.packageDescription)
                                                .font(.system(size: 12, weight: .semibold, design: .default))
                                                .frame(width: 200)
                                                .multilineTextAlignment(.leading)
                                            
                                            HStack{
                                                
                                                Spacer()
                                                    .frame(width: 100)
                                                NavigationLink {
                                                    
                                                } label: {
                                                    Text("View")
                                                        .frame(width: 62, height: 26)
                                                        .background(Color.white)
                                                        .foregroundColor(.black)
                                                        .cornerRadius(8)
                                                    
                                                }
                                            }
                                        }.foregroundColor(.white)
                                        Spacer()
                                    }
                                    
                                }
                                
                                Spacer()
                            }
                            
                        }
                        
                    label: {
                        
                        VStack{
                            ZStack{
                                
                                AsyncImage(url: URL(string: ServicesTypes.servicesImage) , transaction: .init(animation: .spring(response: 1.6))){
                                    image in
                                    switch image {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: .infinity, maxHeight: 200)
                                    case .failure:
                                        Image(systemName: "photo")
                                    @unknown default:
                                        
                                        EmptyView()
                                    }
                                }
                                
                                
                                HStack{
                                    Spacer()
                                    VStack(alignment:.leading){
                                        //                                    Spacer()
                                        //                                    HStack{
                                        
                                        Text(ServicesTypes.name)
                                            .font(.system(size: 32, weight: .bold , design: .default))
                                            .multilineTextAlignment(.leading)
                                        
                                        //                                        Spacer()
                                        //                                            .frame(width: 200)
                                        //                                        Spacer()
                                        
                                        //                                    }
                                        //                                    HStack{
                                        //                                    VStack(alignment:.leading){
                                        Text(ServicesTypes.description)
                                            .font(.system(size: 14, weight: .regular , design: .default))
                                        //                                        .frame(width: 250)
                                        //                                    }
                                            .multilineTextAlignment(.leading)
                                        //                                        .frame(width: 250)
                                        
                                        //
                                        //                                     Spacer()
                                        //                                        Spacer()
                                        //                                        Spacer()
                                        //                                        Spacer()
                                        //                                        Spacer()
                                        
                                        //                                    }
                                        //                                    Spacer()
                                        
                                    }
                                    Spacer()
                                    //                                        .frame(width: 400)
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                //                            .padding()
                                .foregroundColor(.white)
                                //                                .multilineTextAlignment(.leading)
                            }
                        }
                        
                        
                    }
                        
                    }
                    .padding(.horizontal)
                }
                //         .navigationBarTitle("Services")
                .searchable(text: $SearchingFor, prompt: "Search")
                .navigationBarTitle("Services")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                            ProfileView(petInfo: $Moodel.NewPets)
                            
                        }, label: {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                              //  .imageScale(.large)
                                
                                .frame(width: 38, height: 38)
                        })
                    }
                }
            }
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView {
        MainView(servicesVM: ServicesViewModel())
        //}
    }
}

