//
//  AppDelegate.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        application.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = StyleSheet.defaultTheme.mainColor
        UITabBar.appearance().tintColor = StyleSheet.defaultTheme.mainColor
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = FormViewController()
        
            //UINavigationController(rootViewController: FormViewController())
        
        window?.makeKeyAndVisible()

        return true
    }


}

