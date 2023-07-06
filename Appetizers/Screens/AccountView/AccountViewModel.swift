//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Roman Smirnov on 06.07.2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?

    @Published var user: User = User()
    @Published var alertItem: AlertItem?

    func savePressed() {
        guard checkErrorsInForm else {
            return
        }
        saveUser()
    }

    func saveUser() {
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.profileUpdated
        } catch {
            alertItem = AlertContext.profileUpdateFailed
        }
    }

    func loadUser() {
        guard let userData = userData else { return }

        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.profileLoadFailed
        }
    }

    var checkErrorsInForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.emptyStrings
            return false
        }

        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }

        return true
    }
}
