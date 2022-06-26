//
//  SecondScreen.swift
//  PageProfile-HugApp
//
//  Created by AMJAD on 25/11/1443 AH.
//

import SwiftUI


struct AddPetSheet: View {
    @State var pet = PetInfo( PetName: "", GenderPets: .female, BirthDayPets: Date(), heightPet: 0, WeightPet: 0, TypePets: "")
    //DataBase
    @Binding var peet : PetInfo
    @StateObject var Moodel = PetViewModel()
    //BirthDay
    @State var selectedDate: Date = Date()
    //SelectAnima
    @State var selectedPet : Pet = ImagePet.first!
    //Sheet
    @Binding var isPresented: Bool
    @State var isShowing: Bool = false
    // birt
    @State private var birthDate = Date()
    @State private var age: DateComponents = DateComponents()
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView{
            List{
                VStack(alignment: .leading){
                    
                    Text("Your Pet's Name:")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    
                    TextField("Type a name..", text: $pet.PetName)
                        .padding(8)
                        .background(Color("BackgroundGray"))
                       // .foregroundColor(.white)
//                        .background(Color.bgColor)
                        .multilineTextAlignment(.leading)
                }.padding(.bottom , 0)
                HStack{
                    
                 
                    Text("The Gender:")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                }
                HStack {
                  
                    
                    Button(action: {
                        
                        pet.GenderPets = .female
                        
                        
                    }, label: {
                        Text("Female")
                            .foregroundColor(pet.GenderPets == .female ? .white : .black)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .frame(width: 160 , height: 37)
                        
                            .background(pet.GenderPets == .female ? Color.accentColor: Color("Color"))
                            .cornerRadius(12)
                    })
                    Spacer()
                    Button(action: {
                        
                        pet.GenderPets = .male
                        
                    }, label: {
                        Text("Male")
                            .foregroundColor(pet.GenderPets == .male ? .white : .black)
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .frame(width: 160 , height: 37)
                            .background(pet.GenderPets == .male ?   Color.accentColor: Color("Color"))
                            .cornerRadius(12)
                    })
                    
                }.foregroundColor(.black)
                    .buttonStyle(.borderless)
                HStack{
                    
                    Text("Birthday:")
                    
                    
                }
                
                HStack {
                    Text("\(age.year ?? 0)")
               
                
                    DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: [.date]).font(.title)
                        
                        .accentColor(Color.accentColor)
                }.onChange(of: birthDate, perform: { value in
                    age = Calendar.current.dateComponents([.year], from: birthDate, to: Date())
                    
                    
                })
                Spacer()
                .frame(width: 322, height: 33)
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                     
                        Text("Height:")
                        
                    }
                    HStack{
                        HStack{
                            
                            
                            Picker("a pet height", selection: $pet.heightPet) {
                                ForEach(1...30, id: \.self) { num in
                                    Text("\(num)")
                                }
                            }.pickerStyle(.menu)
                            
                            
                        } .frame(width: 159, height: 37.39)
                            .background(Color("BackgroundGray"))
                            .cornerRadius(8)
                    }
                    
                    HStack{
        
                        Text("Weight:")
                    }
                    HStack{
                      
                        
                        Picker("a pet wieght", selection: $pet.WeightPet) {
                            ForEach(1...30, id: \.self) { num in
                                Text("\(num)")
                            }
                        }.pickerStyle(.menu)
                        
                        
                    } .frame(width: 159, height: 37.39)
                        .background(Color("BackgroundGray"))
                        .cornerRadius(8)
                }
                HStack{
                  
                    Text("Pet Type:")
                        .font(.title3)
                    
                }
                
                HStack{
                    //********************************//
                    ForEach(ImagePet){Pet in
                        VStack{
                            Image(Pet.image)
                                .renderingMode(.template)
                                .foregroundColor(selectedPet.image == Pet.image ? Color("BackgroundGray") : Color("petSelected"))
                            // .resizable()
                                .frame(width: 55, height: 44)
                                .padding()
                                .aspectRatio(contentMode: .fit)
                            
                                .background(selectedPet.id == Pet.id ? Color.accentColor : Color("BackgroundGray"))
                            Text(Pet.title )
                                .fontWeight(.bold)
                                .font(.title2)
                                .foregroundColor(selectedPet.id == Pet.id ? .white: .black)
                            
                        }
                        
                        .background(selectedPet.id == Pet.id ? Color.accentColor : Color.gray.opacity(0.06))
                        .frame(width: 88, height: 83)
                        
                        .onTapGesture {
                            withAnimation(.spring()){
                                selectedPet = Pet
                            }
                        }
                    }
                }.listSectionSeparator(.hidden)
                
            }
            .listStyle(.plain)
            .navigationBarTitle("Add Your Pet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    
                    Button{
                        
                        
                        isPresented.toggle()
                    } label: {
                        Text("Cancel")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing){
                  
                    Button{
                        isPresented.toggle()

                        pet.TypePets = selectedPet.image
                        Moodel.addPet(pet: pet)
                        
                    } label: {
                        
                        
                        Text("add")
                    }

                }
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(petInfo: .constant(.init(PetName: "", GenderPets: .male, BirthDayPets: Date(), heightPet: 0, WeightPet: 0, TypePets: "")))
    }
}



extension Color {
    static let bgColor = Color(#colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 0.87))
}

extension UIScreen{
    static let width = UIScreen.main.bounds.width
}
