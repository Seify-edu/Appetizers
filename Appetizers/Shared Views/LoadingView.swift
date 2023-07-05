//
//  LoadingView.swift
//  Appetizers
//
//  Created by Roman Smirnov on 04.07.2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .brandPrimary
        activity.startAnimating()
        return activity
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ActivityIndicator()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
