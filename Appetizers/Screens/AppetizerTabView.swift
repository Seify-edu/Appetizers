//
//  ContentView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "house")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.appetizers.count)
        }
    }
}

struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
