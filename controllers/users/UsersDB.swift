//
//  UsersDB.swift
//  vk_server
//
//  Created by Grisha Pospelov on 14.10.2021.
//


import Foundation
import RealmSwift



class UsersDB {

     let config = Realm.Configuration(schemaVersion: 0)
     lazy var mainRealm = try! Realm(configuration: config)
     var friends: [Friend] = []
    
    
     func addData(_ user: [Friend]) {
        mainRealm.beginWrite()
        friends = user
        let friend = Friend()
        let e = self.friends.count
        var i = 0
        while i < e {
            friend.id = self.friends[i].id
            friend.userName = self.friends[i].firstName
            friend.userName = self.friends[i].photo50
            
            mainRealm.add(user)
            i = i + 1
        }
        do {
            try mainRealm.commitWrite()
        } catch {
            print(error.localizedDescription)
        }
        
     }
    func fetch() -> [Friend] {

             //Прочитать объекты
             let users = mainRealm.objects(Friend.self)

             print(mainRealm.configuration.fileURL)

             return Array(users)
         }
    func delete () {
        try! mainRealm.write{
            mainRealm.deleteAll()
        }
    }
 }
