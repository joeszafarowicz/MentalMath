//
//  AppDelegate.swift
//  MindMath
//
//  Created by Joseph Szafarowicz on 5/18/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if (defaults.bool(forKey: "fiveQuestions") == false) && (defaults.bool(forKey: "tenQuestions") == false) && (defaults.bool(forKey: "fifteenQuestions") == false) && (defaults.bool(forKey: "twentyQuestions") == false) &&
            (defaults.bool(forKey: "twentyfiveQuestions") == false) && (defaults.bool(forKey: "thirtyQuestions") == false) && (defaults.bool(forKey: "thirtyfiveQuestions") == false) && (defaults.bool(forKey: "fourtyQuestions") == false) && (defaults.bool(forKey: "fourtyfiveQuestions") == false) && (defaults.bool(forKey: "fiftyQuestions") == false) {
            defaults.set(true, forKey: "tenQuestions")
        }
        
        if (defaults.bool(forKey: "levelOne") == false) && (defaults.bool(forKey: "levelTwo") == false) && (defaults.bool(forKey: "levelThree") == false) && (defaults.bool(forKey: "levelFour") == false) &&
            (defaults.bool(forKey: "levelFive") == false) &&
            (defaults.bool(forKey: "levelSix") == false) {
            defaults.set(true, forKey: "levelOne")
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

