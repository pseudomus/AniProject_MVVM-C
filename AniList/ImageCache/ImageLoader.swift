//
//  ImageLoader.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private let url: URL

    init(url: URL) {
        self.url = url
        self.loadImage()
    }

    func loadImage() {
        if let image = ImageCache.shared.image(for: url) {
            self.image = image
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, res, error in
            if error != nil {
                return
            }
            guard let data = data, let image = UIImage(data: data) else { return }
            if let url = self?.url {
                ImageCache.shared.insertImage(image, for: url)
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }.resume()

    }
}

