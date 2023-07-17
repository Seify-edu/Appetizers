//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Roman Smirnov on 04.07.2023.
//

import Foundation
import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var isLoading: Bool = false
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?

    let navigationTitle = "Appetizers"

    func getAppetizers() {
        alertItem = nil
        isLoading = true

        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                    isLoading = false
                }
            }
        }
    }
}
