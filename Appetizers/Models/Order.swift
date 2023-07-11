//
//  Order.swift
//  Appetizers
//
//  Created by Roman Smirnov on 10.07.2023.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    var totalPrice: Double {
        appetizers.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }

    func add(_ appetizer: Appetizer) {
        appetizers.append(appetizer)
    }

    func delete(at offsets: IndexSet) {
        appetizers.remove(atOffsets: offsets)
    }

}
