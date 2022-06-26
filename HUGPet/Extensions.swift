

import Foundation
import SwiftUI

extension View {
    /// HalfSheet is a way to show half of View with ability to expand it
    /// - Parameters:
    ///   - isPresented: Binding<Bool>
    ///   - detents: [UISheetPresentationController.Detent.medium() or .lardge()]
    ///   - content:  Content
    ///   - onDismiss:  (() -> Void)?
    /// - Returns: some View
    func halfSheet<Content>(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent],
        cornerRadius: CGFloat,
        content: @escaping () -> Content,
        onDismiss: (() -> Void)?) -> some View where Content : View {
            modifier(
                sheetWithDetentsViewModifier(
                    isPresented: isPresented,
                    detents: detents, cornerRadius: cornerRadius,
                    content: content,
                    onDismiss: onDismiss)
            )
        }
}

struct sheetWithDetentsViewModifier<SwiftUIContent>: ViewModifier where SwiftUIContent: View {
    
    @Binding var isPresented: Bool
    let detents: [UISheetPresentationController.Detent]
    let swiftUIContent: SwiftUIContent
    let cornerRadius: CGFloat
    let onDismiss: (() -> Void)?
    
    init(isPresented: Binding<Bool>,
         detents: [UISheetPresentationController.Detent],
         cornerRadius: CGFloat,
         content: () -> SwiftUIContent,
         onDismiss: (() -> Void)? = nil) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.swiftUIContent = content()
        self.detents = detents
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        ZStack {
            SheetPresentationForSwiftUI($isPresented,onDismiss: onDismiss, detents: detents, cornerRadius: cornerRadius) {
                swiftUIContent
            }
            content
        }
    }
}


struct SheetPresentationForSwiftUI<Content>: UIViewRepresentable where Content: View {
    
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    let detents: [UISheetPresentationController.Detent]
    let cornerRadius: CGFloat
    let content: Content
    
    
    init(
        _ isPresented: Binding<Bool>,
        onDismiss: (() -> Void)? = nil,
        detents: [UISheetPresentationController.Detent] = [.medium()],
        cornerRadius: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.detents = detents
        self.content = content()
        self.cornerRadius = cornerRadius
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        // Create the UIViewController that will be presented by the UIButton
        let viewController = UIViewController()
        
        // Create the UIHostingController that will embed the SwiftUI View
        let hostingController = UIHostingController(rootView: content)
        
        // Add the UIHostingController to the UIViewController
        viewController.addChild(hostingController)
        viewController.view.addSubview(hostingController.view)
        // Set constraints
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
        hostingController.view.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
        hostingController.view.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        hostingController.didMove(toParent: viewController)
        
        // Set the presentationController as a UISheetPresentationController
        if let sheetController = viewController.presentationController as? UISheetPresentationController {
            sheetController.detents = detents
            sheetController.prefersGrabberVisible = true
            sheetController.selectedDetentIdentifier = .medium
            sheetController.preferredCornerRadius = cornerRadius
        }
        
        // Set the coordinator (delegate)
        // We need the delegate to use the presentationControllerDidDismiss function
        viewController.presentationController?.delegate = context.coordinator
        
        
        if isPresented {
            // Present the viewController
            uiView.window?.rootViewController?.present(viewController, animated: true)
        } else {
            // Dismiss the viewController
            uiView.window?.rootViewController?.dismiss(animated: true)
        }
        
    }
    
    /* Creates the custom instance that you use to communicate changes
     from your view controller to other parts of your SwiftUI interface.
     */
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented, onDismiss: onDismiss)
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        @Binding var isPresented: Bool
        let onDismiss: (() -> Void)?
        
        init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil) {
            self._isPresented = isPresented
            self.onDismiss = onDismiss
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            isPresented = false
            if let onDismiss = onDismiss {
                onDismiss()
            }
        }
        
    }
    
}
