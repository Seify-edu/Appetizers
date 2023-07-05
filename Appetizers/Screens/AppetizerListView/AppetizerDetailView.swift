//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 05.07.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    AppetizerDetailStatView(title: "Calories",
                                            value: "\(appetizer.calories)")
                    AppetizerDetailStatView(title: "Carbs",
                                            value: "\(appetizer.carbs) g")
                    AppetizerDetailStatView(title: "Protein",
                                            value: "\(appetizer.protein) g")
                }
            }
            Spacer()
            Button {

            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                APButtonClose()
            }
        }
    }
}

struct AppetizerDetailStatView: View {
    let title: String
    let value: String
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .bold()
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
    }
}

struct AppetizerDetailStatView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailStatView(title: "Calories", value: "34")
    }
}
