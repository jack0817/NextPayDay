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
        self.loadApplication()
    }
    
    deinit {
        print("[DEBUG] SplashViewController deinit")
    }
    
    private func loadApplication() {
        DispatchQueue.global(qos: .background).async {
            DataContext.intializeContext()
            DataContext.entityNames().forEach {
                print("[DEBUG] Entity \($0)")
            }
            self.buildMockDataIfNeeded()
            DispatchQueue.main.async { self.onDidLoadApplication?(self) }
        }
    }
    
    // MARK: Mock Data
    
    public func buildMockDataIfNeeded() {
        let accountAccessor = AccountAccessor()
        let accountCount = accountAccessor.count()
        guard accountCount == 0 else { return }
        
        let monthlyAccount = accountAccessor.new()
        monthlyAccount?.createdDate = NSDate()
        monthlyAccount?.name = "Test Monthly Account"
        monthlyAccount?.accountType = .monthly
        monthlyAccount?.intervals = NSSet(array: [])
        
        let weeklyAccount = accountAccessor.new()
        weeklyAccount?.createdDate = NSDate()
        weeklyAccount?.name = "Test Weekly Account"
        weeklyAccount?.accountType = .weekly
        weeklyAccount?.intervals = NSSet(array: [])
        
        let semiWeeklyAccount = accountAccessor.new()
        semiWeeklyAccount?.createdDate = NSDate()
        semiWeeklyAccount?.name = "Test Semi Weekly Account"
        semiWeeklyAccount?.accountType = .semiWeekly
        semiWeeklyAccount?.intervals = NSSet(array: [])
        
        DataContext.save()
    }
}
