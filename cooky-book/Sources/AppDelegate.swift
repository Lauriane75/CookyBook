//
//  AppDelegate.swift
//  cooky-book
//
//  Created by Lauriane Haydari on 19/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: GeneralCoordinator?
    var context: Context!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let client = HTTPClient()
        let stack = CoreDataStack(modelName: "cooky-book",
                                  type: .prod)
        context = Context(client: client, stack: stack)
        let screens = Screens(context: context)
        let tabBarCoordinator = TabBarCoordinator(screens: screens)
        coordinator = GeneralCoordinator(appDelegate: self,
        context: context,
        screens: screens, tabBarCoordinator: tabBarCoordinator)
        coordinator?.start()
        return true
    }
}
