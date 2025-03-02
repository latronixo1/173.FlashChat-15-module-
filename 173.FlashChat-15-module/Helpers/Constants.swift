//
//  Constants.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 01.03.2025.
//
import UIKit

struct K {
    static let appName = "⚡️FlashChat"
    static let logInName = "Войти"
    static let registerName = "Зарегистрироваться"
    static let emailName = "Email"
    static let passwordName = "Пароль"
    
    static let enterButtonImageName = "paperplane.fill"
    static let enterMessagePlaceholder = "Напишите сообщение"
    
    //идентификатор ячейки в UITableView (ни на что не влияет, просто по нему будем к ней обращаться и переиспользовать)
    static let cellIdentifier = "MessageCell"
    
    static let textFieldImageName = "textField"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct Size {
        static let buttonSize: CGFloat = 48
        static let buttonOffset: CGFloat = 8
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dataField = "date"
    }
    
}
