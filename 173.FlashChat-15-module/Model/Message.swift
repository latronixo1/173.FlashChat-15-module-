//
//  Message.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 02.03.2025.
//

import Foundation

struct Message {
    enum Sender {
        case me, you
    }
    
    let sender: Sender
    let body: String
}

extension Message {
    static func getMessages() -> [Message] {
        
        return [
            Message(sender: .you, body: "Привет! Как дела? 😀"),
            Message(sender: .me, body: "Привет! Я отлично, спасибо😀 А у тебя как дела"),
            Message(sender: .you, body: "Тоже отлично, спасибо что спросил. Есть какие-нибудь планы на выходные? 🎉"),
            Message(sender: .me, body: "Вообще, да! Я иду в поход с друзьями"),
            Message(sender: .me, body: "Мы пойдем исследовать национальный парк Лосиный остров рядом с моим домом, а ты?"),
            Message(sender: .you, body: "Звучит потрясающе! Я планирую дочитать одну книгу и может покататься на велосипеде"),
            Message(sender: .me, body: "Звучит впечатляюще. Хорошего отдыха!😀"),
            Message(sender: .you, body: "👍Взаимно! Береги себя, потом расскажешь как все прошло 😉"),
        ]
    }
}
