//
//  User.swift
//  Appetizers
//
//  Created by Roman Smirnov on 06.07.2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var freequentRefills = true
}
 
