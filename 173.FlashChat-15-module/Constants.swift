//
//  Constants.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 01.03.2025.
//

struct K {
    static let appName = "FlashChat"
    static let logInName = "Войти"
    static let register = "Зарегистрироваться"
    static let emailName = "Email"
    static let passwordName = "Пароль"
    
    static let cellIdentifier = "MessageCell"
    
    static let textFieldImageName = "textField"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dataField = "date"
    }
    
}
