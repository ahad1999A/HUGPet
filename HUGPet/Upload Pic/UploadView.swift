//
//  UploadView.swift
//  HUGPet
//
//  Created by ABRAR on 24/11/1443 AH.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore


struct UploadView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    @State var retrivedImage = [UIImage]()
    @State var url = [Photos]()
    
    
    
    var body: some View {
        
        VStack{
           
//            Image(uiImage: selectedImage)
//                .resizable()
//                .frame(width: 200, height: 200)
            
            Button{
                self.isPickerShowing.toggle()
//uploadPhoto()

           
                
            } label: {
                if selectedImage == nil {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 158, height: 158)
                        //.clipShape(Circle())
                        .foregroundColor(Color.gray)
                 //   Text("Select a Photo")
                    
                }      else {
                    VStack{
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 158, height: 158)
                        .clipShape(Circle())
                       
                    Button {
                        uploadPhoto()
                    } label: {
                        Text("Uploada Photo")
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            //.frame(width: 324, height: 56)
                    }
                    }
              
                }
             
                
            }
            
            List {
                Section("Pet Info"){
                Text("Melo")
                Text("Dodi")
                }
                .listRowBackground(Color("BackgroundGray"))
                
                
                Section("account settings"){
                Text("Update mobile number")
                Text("previous requests")
                }.listRowBackground(Color("BackgroundGray"))
                Section("About App"){
                Text("About HUG")
                }.listRowBackground(Color("BackgroundGray"))
            }
          
           
      
        }.sheet(isPresented: $isPickerShowing , onDismiss: nil) {
        ImagePicker(selectdImage: $selectedImage,isPickerShowing: $isPickerShowing)
        //end vstack
        
    }.onAppear{
        RetrivePhoto{ photoArray in
            self.url = photoArray ?? []
        }
    }
}
    // start func
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
    

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
}

