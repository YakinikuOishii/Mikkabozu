//
//  AppDelegate.swift
//  Mikkabozu
//
//  Created by 笠原未来 on 2018/02/20.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // アプリ起動時に呼ばれる
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Allowed")
            } else {
                print("Didn't allowed")
            }
        }
        return true
    }
    
    
    func applicationDidEnterBackground(_application: UIApplication) {
        print("アプリ閉じた時")
        let center = UNUserNotificationCenter.current()
        center.delegate = self as! UNUserNotificationCenterDelegate
        
        let content = UNMutableNotificationContent()
        content.title = "たいとる"
        content.body = "サンプルのbodyです"
        content.badge = 1
        content.sound = .default()
        //        let component = DateComponents(calendar: Calendar.current, year: 2017, month: 3, day: 27, hour: 23, minute: 30)
        // ここのタイミングを変えれば良い　指定した秒数後に通知
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        
        center.add(request)
//        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound], completionHandler: { result, error in })

    }
    
}



