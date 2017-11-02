//
//  AppContainerViewController.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import UIKit

public class AppContainerViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        showSplashView()
    }
    
    private func showSplashView() {
        let splashStoryBoard = UIStoryboard(name: "Splash", bundle: nil)
        let splashViewController = splashStoryBoard.instantiateInitialViewController() as! SplashViewController
        splashViewController.onDidLoadApplication = { [weak self] in
            self?.handleSplashDidLoadApplication(for: $0)
        }
        addChildViewController(splashViewController)
        self.view.addSubview(splashViewController.view)
        splashViewController.view.frame = self.view.bounds
    }
    
    private func handleSplashDidLoadApplication(for splashViewController: SplashViewController) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [],
            animations: {
                splashViewController.view.frame.origin.y = self.view.bounds.height
            },
            completion: { completed in
                splashViewController.view.removeFromSuperview()
                splashViewController.removeFromParentViewController()
            }
        )
    }
}
