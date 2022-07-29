//
//  TextFieldAlert.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import SwiftUI

struct TextFieldAlert {

    // MARK: Properties
    let title: String
    let message: String?
    var isPresented: Binding<Bool>? = nil

    // MARK: - Methods
    func dismissable(_ isPresented: Binding<Bool>) -> TextFieldAlert {
        TextFieldAlert(title: title, message: message, isPresented: isPresented)
    }
}

extension TextFieldAlert: UIViewControllerRepresentable {

    typealias UIViewControllerType = TextFieldAlertViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<TextFieldAlert>) -> UIViewControllerType {
        TextFieldAlertViewController(title: title, message: message, isPresented: isPresented)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<TextFieldAlert>) {}
}
