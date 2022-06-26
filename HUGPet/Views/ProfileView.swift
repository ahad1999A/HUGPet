//
//  firstScreen.swift
//  PageProfile-HugApp
//
//  Created by AMJAD on 25/11/1443 AH.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import Kingfisher

struct ProfileView: View {
    //DataBase
    @StateObject var Moodel = PetViewModel()
    @Binding var petInfo : PetInfo
    @State var isShowing: Bool = false
    
    //    // Page
    @State var showNewScreen : Bool = false
    @State private var DarkMode = false
    @State private var Notification = false
    @State private var SuccessPart = ""
    @State private var CounnectWithUs = ""
    @State private var AboutHUG = ""
    @State private var histori = ""
    @State private var UpNumber = ""
    
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var retrivedImage = [UIImage]()
    @State var url = [Photos]()
    
    
    
    var body: some View {
            VStack{
              
                Button(action: {
                    
                    self.isPickerShowing.toggle()
                    
                }, label: {
                    if selectedImage == nil {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            //.clipShape(Circle())
                            .foregroundColor(Color.gray)
                     //   Text("Select a Photo")
                        
                    }      else {
                        VStack{
                        Image(uiImage: selectedImage!)
                        //    KFImage(URL(string: url))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                           
//                        Button {
//                            uploadPhoto()
//                        } label: {
////                            Text("Upload Photo")
////                                .bold()
//                              //  .frame(width: 250, height: 50)
//                              //  .background(Color.accentColor)
////                                .foregroundColor(Color.accentColor)
////                                .cornerRadius(16)
//                                //.frame(width: 324, height: 56)
//                        }
                        }
                  
                    }
//                    VStack{
//                        Image(systemName: "person.circle.fill")
//                            .resizable()
//                            .frame(width: 120, height: 120)
//                            .clipShape(Circle())
//                            .foregroundColor(.gray)
//                        Text("Add a profile picture")
//                            .foregroundColor(Color.accentColor)
//                    }
                    
                })
                // end button 1
                
//                Button(action: {
//
//
//                }, label: {
//                    HStack{
//                        Text("Shaima")
//                            .foregroundColor(.black)
//                        Image(systemName: "pencil.circle")
//                            .foregroundColor(Color.accentColor)
//                            .frame(width: 20, height: 20)
//                            .clipShape(Circle())
//                            .foregroundColor(.gray)
//                    }
//
//                })
                
                Form{
                   
                    ForEach(Moodel.pets){ pet in
                        Button(action: {
                            
                            
                        }, label: {
                            Text(pet.PetName)
//                                .foregroundColor(.white)
                            
                        })  .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                Moodel.deletPet(pet: pet)
                                
                            } label: {
                                Image(systemName: "trash")
                            }
                            
                        }
                        
                    }
                    
                    // Button +
                    
//                    Section(header: Text("Your Pets Information")){
                    HStack{
                        
                        Button(action: {
                            
                            isShowing.toggle()
                            
                        }, label: {
                            Image(systemName:"plus.circle.fill")
                                .foregroundColor(Color.accentColor)
                                .font(.system(size: 20))
                            
                        })
                        .halfSheet(isPresented: $isShowing, detents: [.medium(), .large()], cornerRadius: 12) {
                            
                            AddPetSheet(peet:$Moodel.NewPets, isPresented: $isShowing)
                            
                        } onDismiss: {

                        }
                        
                    }.frame(width: 30)
                   // }
                    Section(header: Text("account information")){
                        HStack{
                            
                            Picker(selection: $UpNumber, label: Text("Update Phone Number")){
                                
                                
                            }
                            
                        }
                        HStack{
                            
                            Picker(selection: $histori, label: Text("Previous Order")){
                                
                            }
                        }
                        
                        
                        Toggle("Notifications", isOn: $Notification )
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                    }
                    Section(header: Text("About Application")){
                        HStack{
                            
                            Picker(selection: $SuccessPart, label: Text("Partners")){
                                
                                
                            }
                        }
                        HStack{
                            
                            Picker(selection: $CounnectWithUs, label: Text("Contact Us")){
                                
                            }
                        }
                        HStack{
                            
                            Picker(selection: $AboutHUG , label: Text("About HUG")){
                                
                            }
                        }
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Log Out")
                            .frame( height: 53)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                    })
                    
                    
                }
            } .sheet(isPresented: $isPickerShowing , onDismiss: nil) {
                ImagePicker(selectdImage: $selectedImage,isPickerShowing: $isPickerShowing)
                    .onDisappear{
                    if selectedImage != nil {
                        uploadPhoto()
                    }
                    
                }
                //end vstack
                
            }.onAppear{
                RetrivePhoto{ photoArray in
                    self.url = photoArray ?? []
                }
            }
            
          //  .foregroundColor(.black)
            .navigationBarTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
       // }
        
    }
    
    func uploadPhoto() {
        
        // Make sure that the selected image property isn't nil
        guard selectedImage != nil else {
            return
        }
        
        // Create storage referenne
        let storageRef = Storage.storage().reference()
        
        // Trun our image into data
        let imageDate = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageDate != nil else {
            return
        }
        
        // Specify the file path and nsme
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        fileRef.putData(imageDate!, metadata: nil){metadata,error in
            
            if error == nil && metadata != nil {
                
                let db = Firestore.firestore()
                fileRef.downloadURL{url ,error in
                    db.collection("images").document().setData(["url":url?.absoluteString]){error in
                        if error == nil {
                            DispatchQueue.main.async {
                                self.retrivedImage.append(self.selectedImage!)
                                self.RetrivePhoto {
                                    photoArry in
                                    self.url = photoArry ?? []
                                }
                                self.selectedImage = nil
                            }
                        }
                        
                    }
                }

                //Save a reference to that file in Firestore DB
            }

        }

        
    
        // Check for errors
        
       
        
    }
    // end func
    func RetrivePhoto(completion: @escaping ([Photos]?)->Void) {
        let db = Firestore.firestore()
        db.collection("image").addSnapshotListener {(querySnapshot, error) in
           guard let documents = querySnapshot?.documents else {
            print ("No documents in collection")
            completion(nil)
            return
           }
          self.url = documents.compactMap { queryDocumentSnapshot in
            let result = Result { try queryDocumentSnapshot.data(as: Photos.self) }
            switch result {
            case .success(let store):
              return store
            case .failure(let error):
              return nil
            }
           }
          completion(self.url)
          }
        }
    

}

struct firstScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView(petInfo: .constant(.init(PetName: "", GenderPets: .male, BirthDayPets: Date(), heightPet: 0, WeightPet: 0, TypePets: "")))
        
    }
}
