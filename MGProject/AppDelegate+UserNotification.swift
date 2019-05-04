// 
//  AppDelegate+UserNotification.swift
//
//  Created by harald bregu on 29/04/2019.
//  Copyright © 2019 Dream Building Company. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import UserNotifications

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
        
        // Print full message.
//        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        let userInfo = response.notification.request.content.userInfo
        
//        let notification = UNMutableNotificationContent()
//        notification.title = "AXA registrazione"
//        notification.subtitle = "Conferma la registrazione"
//        notification.body = "Per completare la registrazione su AXA verifica la tua email clickando su questo link"
//        notification.categoryIdentifier = "TEST_IDENTIFIER_LOCAL_NOTIFICATION"
//        notification.userInfo["email_verify_token"] = userResponse?.token
//        notification.userInfo["user_id"] = textfieldEmail.text
//        notification.userInfo["person_id"] = userResponse?.personId
//        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 4, repeats: false)
//        let identifier = "TEST_IDENTIFIER"
//        let request = UNNotificationRequest(identifier: identifier, content: notification, trigger: notificationTrigger)
//        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
//            print("Message ID: \(error)")
//        })

        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("Message ID: \(messageID)")
//        }
        
        // Print full message.
//        print(userInfo)
        
        completionHandler()
    }
    
}
