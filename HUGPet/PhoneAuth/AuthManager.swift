//
//  AuthManager.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 23/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


class AuthManager: ObservableObject{
    
    @Published var verificationId: String?
    let auth = Auth.auth()
    
    
    func createAccountWithPhoneNumber(phoneNumber: String , completion: @escaping ( (Bool) -> () )){
        let phoneNumber = "+966" + phoneNumber
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil){ verificationId , error in
            if let _ = error {
                print("Error while getting sms Code")
                return
            }
            self.verificationId = verificationId
            completion(true)
        }
    }
    
    func verifySMSCode(verificationCode: String , phoneNumber: String , completion: @escaping ( (Bool) -> () )){
        
        guard let verificationId = verificationId else {return}
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: verificationCode)
        
        auth.signIn(with: credential) { authResult , error in
            if let error = error {
                print("DEBUG: error while verifying smsCode \(error)")
            }
            print("DEBUG: 6 - Successfully Uploaded user info to firebase with saved phone number")
            guard let authResult = authResult else {return}
            let userId = authResult.user.uid
            let userData = [
                "id": userId,
                "phoneNumber": phoneNumber
            ]
            
            Firestore.firestore().collection("users").document(userId).setData(userData)
            completion(true)
        }
        
        
    }
}

