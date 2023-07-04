//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Roman Smirnov on 04.07.2023.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var isLoading: Bool = false
    let navigationTitle = "Appetizers"

    func onAppear() {
        getAppetizers()
    }

    func getAppetizers() {
        alertItem = nil
        isLoading = true

        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
                self.isLoading = false
            }
        }
    }
}
