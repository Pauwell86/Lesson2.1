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
    
    var myFriendsDict = [String: [User]]()
    var myFriendsSectionTitles = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: friendTableViewCellReuse)
        
        createMyFriendsDict()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return myFriendsSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return myFriendsSectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let myFriendKey = myFriendsSectionTitles[section]
        guard let myFriendValues = myFriendsDict[myFriendKey] else { return 0 }
        
        return myFriendValues.count
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

        let myFriendKey = myFriendsSectionTitles[indexPath.section]
        if let myFriendValues = myFriendsDict[myFriendKey] {
            
            cell.configureWithUser(user: myFriendValues[indexPath.row])
            
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func createMyFriendsDict() {
        for friend in DataStorage.shared.myFriendsArray {
            let firstLetterIndex = friend.name.index(friend.name.startIndex, offsetBy: 1)
            let friendKey = String(friend.name[..<firstLetterIndex])
          //  let tempKey = String(friend.name.startIndex)
            
            if  var myFriendValue = myFriendsDict[friendKey] {
                myFriendValue.append(friend)
                myFriendsDict[friendKey] = myFriendValue
            } else {
                myFriendsDict[friendKey] = [friend]
                
            }
        }
        
        myFriendsSectionTitles = [String](myFriendsDict.keys)
        myFriendsSectionTitles = myFriendsSectionTitles.sorted(by: { $0 < $1 })
        
    }
    
    
    
}
