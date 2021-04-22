//
//  ViewController.swift
//  VK
//
//  Created by Pauwell on 13.04.2021.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    func fillUsersArray() {
        
        let user1 = setNewUser(userNumber: 1, userName: "Вова", userAge: 68)
        let user2 = setNewUser(userNumber: 2, userName: "Джо", userAge: 78)
        let user3 = setNewUser(userNumber: 3, userName: "Анжела", userAge: 66)
        let user4 = setNewUser(userNumber: 4, userName: "Ким", userAge: 37)
        let user5 = setNewUser(userNumber: 5, userName: "Эмик", userAge: 43)
        
        let usersArray = [user1, user2, user3, user4, user5]
        
        let group1 = Group(name: "Пиво всему голова!",
                           discription: "Группа любителей пива. История. Сорта. Отзывы.",
                           groupImage: UIImage(named: "Пиво"))
        let group2 = Group(name: "F1",
                           discription: "Все о Формуле 1. Турнирная таблица. Расписание гонок.",
                           groupImage: UIImage(named: "Формула1"))
        let group3 = Group(name: "Поохотимся?",
                           discription: "Все о охоте, оружие и экипировке",
                           groupImage: UIImage(named: "Охота"))
        let group4 = Group(name: "Футбол",
                           discription: "Все о футболе. Расписание матчей",
                           groupImage: UIImage(named: "Футбол"))
        
        let groupsArray = [group1, group2, group3, group4]
        
        DataStorage.shared.myFriendsArray = usersArray
        DataStorage.shared.allGroups = groupsArray
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fillUsersArray()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
