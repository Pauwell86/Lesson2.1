//
//  FriendsTableViewController.swift
//  VK
//
//  Created by Pauwell on 12.04.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let fromFriendsToFriendSegue = "fromFriendsToFriendSegue"
    let friendTableViewCellReuse = "MyTableViewCell"
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: friendTableViewCellReuse)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataStorage.shared.myFriendsArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MyTableViewCell,
              let user = cell.saveUser
        else {return}
        
        performSegue(withIdentifier: fromFriendsToFriendSegue, sender: user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == fromFriendsToFriendSegue {
            guard let user = sender as? User,
                  let destenation = segue.destination as? FotoCollectionViewController
            else { return }
            destenation.user = user
        }
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendTableViewCellReuse, for: indexPath) as? MyTableViewCell else {return UITableViewCell()}

        cell.configureWithUser(user: DataStorage.shared.myFriendsArray[indexPath.row])
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
