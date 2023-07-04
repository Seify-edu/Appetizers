//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject private var viewModel: AppetizerListViewModel = AppetizerListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle(viewModel.navigationTitle)
        }
        .onAppear {
            viewModel.onAppear()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.button)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
