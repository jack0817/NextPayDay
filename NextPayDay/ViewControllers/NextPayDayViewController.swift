//
//  NextPayDayViewController.swift
//  NextPayDay
//
//  Created by Wendell Thompson on 11/2/17.
//  Copyright © 2017 Wendell. All rights reserved.
//

import Foundation
import UIKit

public class NextPayDayViewController: UITableViewController {
    
    private let accountAccessor = AccountAccessor()
    private var accounts: [Account] = []
    
    // MARK: View Lifecycle
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchAccountsAsync()
    }
    
    // MARK: Private Functions
    
    private func fetchAccountsAsync() {
        let sort = AccountProperty.createdDate.sortDescriptor(ascending: true)
        accountAccessor.fetchAllAsync(sortedBy: [sort]) { accounts in
            self.accounts = accounts
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    // MARK: UITableViewDataSource
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accounts.count
    }
    
    public override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") else {
            return UITableViewCell(style: .default, reuseIdentifier: "")
        }
        
        let account = self.accounts[indexPath.row]
        cell.textLabel?.text = account.name
        cell.detailTextLabel?.text = account.accountType.description
        return cell
    }
}
