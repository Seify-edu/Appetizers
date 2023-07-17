//
//  AccountView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel: AccountViewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.return)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    Button {
                        viewModel.savePressed()
                    } label: {
                        Text("Save Changes")
                    }
                }
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Freequent Refills", isOn: $viewModel.user.freequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.loadUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.button)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
