//
//  LoginByPhone.swift
//  HUGPet
//
//  Created by Ahad Obaid Albaqami on 23/11/1443 AH.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct LoginByPhone: View {
    
    @State var isShowingHomeView: Bool = false
    @State var phoneNumber: String = ""
    @State var smsCode: String = ""
    @StateObject var authManager = AuthManager()
    
    var body: some View {
      //  NavigationView{
            VStack{
                HStack{
                Text("Phone Number")
                    
                    
                    .font(.system(size: 12, weight: .bold, design: .default))
                    Spacer()
                        .frame(width: 240)
                }
                TextField("548.....", text: $phoneNumber)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 0.5)
                    )
                    .padding()
                Button {
                    
//                    authManager.createUserWithPhoneNumber(phoneNumber: phoneNumber)
//
                    
                    authManager.createAccountWithPhoneNumber(phoneNumber: phoneNumber)
                    { isSuccess in
                        print("DEBUG: phone \(isSuccess)")
                    }
                    
                } label: {
                    Text("Create Account")
                        .frame(width: 300, height: 50)
                        .background(Color.accentColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .disabled(phoneNumber.isEmpty)
                Divider()
                
                HStack{
                Text("Enter OTP")
                    .font(.system(size: 12, weight: .bold, design: .default))
                    
                    Spacer()
                        .frame(width: 270)

                }
                TextField("Enter OTP Code", text: $smsCode)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 0.5)
                    )
                    .padding()
                
                
                Button {
                    DispatchQueue.main.async {
                        authManager.verifySMSCode(verificationCode: smsCode, phoneNumber: phoneNumber) { isSuccess in
                            print("DEBUG: in code \(isSuccess)")
                            isShowingHomeView.toggle()
                        }
                    }
                } label: {
                    Text("Verify Code")
                        .frame(width: 300, height: 50)
                        .background(Color.accentColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .disabled(smsCode.isEmpty)
               
                
                Text("By joining, you agree to \(Text("our Terms of Service and Privacy Policy").foregroundColor(.blue))")

                    .font(.system(size: 14, weight: .medium, design: .default))
                
                    .padding()
                
            }
         //   .navigationTitle("Login")
            
         
        //}
        .fullScreenCover(isPresented: $isShowingHomeView) {
           // MainView(servicesVM: ServicesViewModel())
           TabBarView()
        }
    }
}



struct LoginByPhone_Previews: PreviewProvider {
    static var previews: some View {
        LoginByPhone()
    }
}
//
//struct MainView: View{
//    var body: some View{
//        NavigationView{
//        Text("Main View")
//
//        }.navigationTitle("Services")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Image(systemName: "person.crop.fill")
//                }
//            }
//    }
//}
