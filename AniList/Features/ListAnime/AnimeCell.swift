//
//  AnimeCell.swift
//  AniList
//
//  Created by Luca Lacerda on 22/04/25.
//

import SwiftUI

struct AnimeCell: View {

    var anime: AnimePreview

    var body: some View {
        ZStack {
            VStack {
                CImageView(url: anime.image)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 170, height: 230)
            }
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.linearGradient(colors: [.clear,.clear,.black], startPoint: .top, endPoint: .bottom))
            VStack {
                Spacer()
                Text(anime.title)
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        }
        .shadow(radius: 4)
    }
}

#Preview {
    AnimeCell(anime: AnimePreview(id: 16498,
                                  image: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx16498-buvcRTBx4NSm.jpg")!,
                                  title: "Attack on Titan",
                                  status: "FINISHED",
                                  episodes: 25))
}
