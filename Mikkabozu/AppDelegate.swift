//
//  AppDelegate.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/02/20.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let content = UNMutableNotificationContent()
        content.title = "たいとる"
        let component = DateComponents(calendar: Calendar.current, year: 2017, month: 3, day: 27, hour: 23, minute: 30)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: false)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.delegate = self as! UNUserNotificationCenterDelegate
        center.add(request)
        
        return true
    }
}



