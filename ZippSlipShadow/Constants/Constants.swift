//
//  Constants.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 03/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import Foundation

struct Constants{
    
   static let LOGIN_SEGUE = "navigate_to_login"
   static let HOME_SEGUE = "homeScreenNavigation"
    static let FORGOT_SEGUE = "forgetScreen"
    static let TASK_NAVIGATION = "taskScreen"
    static let TAB_SCREEN = "tabScreen"

    static let RESUABLE_CHAT_CELL="reuseableChatCell"
    static let MESSAGE_CELL = "MessageCell"
    static let MENU_CONTROLLER="MenuViewController"
    static let CUSTOM_CELL = "CustomCellCollectionViewCell"
    static let RESUABLE_COLLECTION_CELL="collectionCell"
    
    
    static let CHAT_SCREEN="Chat"
    static let TO="to"
    static let FROM="from"
    
    struct FStore {
        static let COLLECTION_NAME = "message"
        static let SENDER_FIELD = "sender"
        static let BODY_FIELD = "body"
        static let DOCUMENT_NAME = "messageCell"
        static let dateField = "date"
    }
    
    struct UserDefaultKey {
        static let IS_LOGIN  = "IS_LOGIN"
    }
    
    enum MenuType: Int {
        case home
        case Message
        case Logout
    }
}
