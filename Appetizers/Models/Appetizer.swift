//
//  Appetizer.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let carbs: Int
    let protein: Int
    let calories: Int
}

struct AppetizeResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer: Appetizer = Appetizer(id: 1,
                                                      name: "Test Appetizer",
                                                      description: "This is the description for my appetizer. It's yummy.",
                                                      price: 1.23,
                                                      imageURL: "",
                                                      carbs: 4,
                                                      protein: 15,
                                                      calories: 66)
    static let orderAppetizer1: Appetizer = Appetizer(id: 2,
                                                      name: "Order Appetizer 1",
                                                      description: "This is the description for my appetizer. It's yummy.",
                                                      price: 1.23,
                                                      imageURL: "",
                                                      carbs: 4,
                                                      protein: 15,
                                                      calories: 66)
    static let orderAppetizer2: Appetizer = Appetizer(id: 3,
                                                      name: "Order Appetizer 2",
                                                      description: "This is the description for my appetizer. It's yummy.",
                                                      price: 1.23,
                                                      imageURL: "",
                                                      carbs: 4,
                                                      protein: 15,
                                                      calories: 66)
    static let orderAppetizer3: Appetizer = Appetizer(id: 4,
                                                      name: "Order Appetizer 3",
                                                      description: "This is the description for my appetizer. It's yummy.",
                                                      price: 1.23,
                                                      imageURL: "",
                                                      carbs: 4,
                                                      protein: 15,
                                                      calories: 66)
//    static let appetizers: [Appetizer] = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let orderAppetizers: [Appetizer] = [orderAppetizer1, orderAppetizer2, orderAppetizer3]
}
