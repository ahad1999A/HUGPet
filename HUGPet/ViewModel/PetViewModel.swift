//
//  PetViewModel.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 26/11/1443 AH.
//

import Foundation

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class PetViewModel: ObservableObject{
    @Published var pets = [PetInfo]()
    
    @Published var NewPets: PetInfo = PetInfo(id: "", PetName: "", GenderPets: .female, BirthDayPets: Date(), heightPet: 0, WeightPet: 0, TypePets: "")
    init(){
        fitchPets()
    }
    func addPet(pet: PetInfo){
        try? Firestore.firestore().collection("PetInfo").document(pet.id).setData(from: pet)
    }
    func fitchPets(){
        Firestore.firestore().collection("PetInfo").addSnapshotListener{ snapshot, erorr in
            guard let pets = snapshot?.documents.compactMap({try? $0.data (as: PetInfo.self)}) else{  return}
            self.pets = pets
        }
    }
    func deletPet(pet : PetInfo){
        
         Firestore.firestore().collection("PetInfo").document(pet.id).delete()

        
    }
}
