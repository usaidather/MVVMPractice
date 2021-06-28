//
//  UserViewModal.swift
//  MVVM Practice
//
//  Created by Usaid Ather on 29/06/2021.
//

import UIKit

class UserViewModal{
    weak var viewController : UIViewController?
    var usersArray = [UserModal]()
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "http://jsonplaceholder.typicode.com/users")!) {
            (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode(UserModal.self, from: data)
                        print(userResponse)
                    }
                    catch let err {
                        print(err.localizedDescription)
                    }
                }
                else{
                    print(error?.localizedDescription as Any)
                    
                }
            }
        }.resume()
    }
}
