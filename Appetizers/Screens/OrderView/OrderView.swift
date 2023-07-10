//
//  OrderView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import SwiftUI

struct OrderView: View {
    @StateObject private var viewModel: OrderViewModel = OrderViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(.plain)
                    Spacer()
                    Button {
                        print("viewModel.appetizers = \(viewModel.appetizers)")
                    } label: {
                        APButton(title: "sss")
                    }
                    .padding(.bottom)
                }
                if viewModel.appetizers.count == 0 {
                    EmptyStateView(imageName: "empty-order", message: "You have no items in your order.")
                }
            }
            .navigationTitle(viewModel.navigationTitle)
            .disabled(viewModel.isShowingDetail)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }

    func delete(at offsets: IndexSet) {
        viewModel.appetizers.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
