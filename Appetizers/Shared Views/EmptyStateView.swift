//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 07.07.2023.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: String
    let message: String
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea() 
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(imageName: "empty-order", message: "Default Message")
    }
}
