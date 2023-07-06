//
//  Alert.swift
//  Appetizers
//
//  Created by Roman Smirnov on 04.07.2023.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var button: Alert.Button
}

//MARK: - Network
struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                      button: .default(Text("ok")))

    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support."),
                                       button: .default(Text("ok")))

    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from server. Please try again later or contact support."),
                                           button: .default(Text("ok")))

    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            button: .default(Text("ok")))
}

//MARK: - Account
extension AlertContext {
    static let emptyStrings = AlertItem(title: Text("Empty fields"),
                                        message: Text("Form contains one or more empty fields"),
                                        button: .default(Text("ok")))
    static let invalidEmail = AlertItem(title: Text("Invalid email"),
                                        message: Text("Email is not valid"),
                                        button: .default(Text("ok")))
    static let profileUpdated = AlertItem(title: Text("Profile updated"),
                                        message: Text("Your profile info has been successfully updated"),
                                        button: .default(Text("ok")))
    static let profileUpdateFailed = AlertItem(title: Text("Profile update failed"),
                                        message: Text("Failed to update profile info"),
                                        button: .default(Text("ok")))
    static let profileLoadFailed = AlertItem(title: Text("Profile loading failed"),
                                        message: Text("Failed to load profile info"),
                                        button: .default(Text("ok")))
}
