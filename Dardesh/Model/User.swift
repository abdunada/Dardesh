//
//  User.swift
//  Dardesh
//
//  Created by Abdelrahman Nada on 24/12/2021.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable {
    var username: String
    var email: String
    var status: String
    var  id = ""
    var pushId = ""
    var avaterLink = ""
}
