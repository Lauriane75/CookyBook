//
//  AppDelegate.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 19/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AuthentificationCoordinator!
    var context: Context!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
//        FirebaseApp.configure()

        let client = HTTPClient()

        context = Context(client: client)

        coordinator = AuthentificationCoordinator(presenter: window!,
                                         context: context)
        coordinator?.start()

        return true
    }
}


//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//    var coordinator: GeneralCoordinator?
//    var context: Context!
//
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        let client = HTTPClient()
//        context = Context(client: client)
//        let screens = Screens(context: context)
//        let tabBarCoordinator = TabBarCoordinator(screens: screens)
//        coordinator = GeneralCoordinator(appDelegate: self,
//        context: context,
//        screens: screens, tabBarCoordinator: tabBarCoordinator)
//        coordinator?.start()
//        return true
//    }
//}
