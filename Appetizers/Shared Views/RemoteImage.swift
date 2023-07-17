//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Roman Smirnov on 04.07.2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil

    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage else {
                return
            }

            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        let currentImage = image ?? Image("food-placeholder")
        return currentImage.resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader: ImageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(from: urlString)
            }
    }
}
