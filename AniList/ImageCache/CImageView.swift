//
//  CImageView.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

struct CImageView: View {

    @StateObject var ImageLoader: ImageLoader

    init(url: URL) {
        _ImageLoader = .init(wrappedValue: .init(url: url))
    }

    var body: some View {
        if let image = ImageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
        }
    }
}
