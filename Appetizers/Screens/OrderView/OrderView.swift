//
//  OrderView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    @StateObject private var viewModel: OrderViewModel = OrderViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.delete)
                    }
                    .listStyle(.plain)
                    Spacer()
                    Button {

                    } label: {
                        APButton(title: "Place Order : $\(order.totalPrice, specifier: "%.2f")")
                    }
                    .padding(.bottom)
                }
                if order.appetizers.count == 0 {
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
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
