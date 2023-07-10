//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Roman Smirnov on 06.07.2023.
//

import Foundation

final class OrderViewModel: ObservableObject {
    @Published var appetizers : [Appetizer] = MockData.orderAppetizers
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?

    let navigationTitle = "Order"

    func onAppear() {
        
    }
}
