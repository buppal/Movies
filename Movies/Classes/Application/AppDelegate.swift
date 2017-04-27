//
//  AppDelegate.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        startupApp()
        return true
    }

    // MARK: - Private functions

    private func startupApp() {
        let appController = AppController.sharedInstance
        appController.startupApp()
    }
}
