//
//  ImagePicker.swift
//  HUGPet
//
//  Created by ABRAR on 24/11/1443 AH.
//

import SwiftUI
import UIKit
import Foundation

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectdImage: UIImage?
    @Binding var isPickerShowing: Bool
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeCoordinator() -> Coodinator {
        return Coodinator(self)
    }
    class Coodinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent: ImagePicker
        
        init(_ picker: ImagePicker){
            self.parent = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("image selected")
            if let image = info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage{
               
                self.parent.selectdImage = image
            }
            parent.isPickerShowing = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("cancelled")
            
            
            parent.isPickerShowing = false
        }
    }
    
}

