//
//  LoginValidataor.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/16.
//

import Foundation

protocol LoginProtocol {
    func login()
    func logout()
}


class LoginValidator: LoginProtocol {
    func login() {
        print("login")
    }
    
    func logout() {
        print("logout")
    }
}
