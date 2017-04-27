//
//  AppController.swift
//  Movies
//
//  Created by Banijyot Uppal on 4/20/17.
//  Copyright © 2017 Banijyot Uppal. All rights reserved.
//

import UIKit

class AppController {
    static let sharedInstance = AppController()

    func startupApp() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegate?.window else {
            fatalError("Could not start app, no window.")
        }

        let navigationController = window.rootViewController as! UINavigationController
        let homeViewController = navigationController.viewControllers.first as! HomeViewController
        let viewModel = HomeViewModel()
        viewModel.presenter = homeViewController
        homeViewController.viewModel = viewModel

    }
}
