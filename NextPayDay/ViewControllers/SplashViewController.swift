//
//  SplashViewController.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import UIKit

public class SplashViewController: UIViewController {
    
    public var onDidLoadApplication: ((SplashViewController) -> Void)?
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.onDidLoadApplication?(self)
        }
    }
    
    deinit {
        print("[DEBUG] SplashViewController deinit")
    }
}
