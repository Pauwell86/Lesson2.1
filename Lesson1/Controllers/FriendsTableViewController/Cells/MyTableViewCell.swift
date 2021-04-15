//
//  MyTableViewCell.swift
//  VK
//
//  Created by Pauwell on 13.04.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var saveUser: User?
    var saveGroup: Group?
    
    func clearCell() {
        myImage.image = nil
        nameLabel.text = nil
        ageLabel.text = nil
        saveUser = nil
        saveGroup = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }

    override func prepareForReuse() {
        clearCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithUser(user: User) {
        nameLabel.text = user.name
        
        if let age = user.age {
            ageLabel.text = String(age) + " лет"
        }
        
        if let image = user.avatar {
            myImage.image = image
        }
        saveUser = user
        
    }
    
    func configureWithGroup(group: Group) {
        nameLabel.text = group.name
        
        if group.discription != nil {
            ageLabel.text = group.discription
        }
        
        if let image = group.groupImage {
            myImage.image = image
        }
        
        saveGroup = group
                
    }
}
