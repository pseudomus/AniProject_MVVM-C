//
//  AnimeDetailView.swift
//  AniList
//
//  Created by Luca Lacerda on 15/04/25.
//

import SwiftUI

protocol AnimeDetailVewDataSource: ObservableObject {
    var anime: AnimeDetail? { get }

    func onTaskCalled()
}

struct AnimeDetailView<viewModel: AnimeDetailVewDataSource>: View {

    @StateObject var vm: viewModel
    @EnvironmentObject var coordinator: AppCoordinatorImpl

    init(viewModel: viewModel) {
        _vm = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if let anime = vm.anime {
                GeometryReader { proxy in
                    CImageView(url: anime.image)
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -proxy.frame(in: .global).minY)
                        .frame(width: proxy.size.width,
                               height: proxy.frame(in: .global).minY > 0 ? proxy.frame(in: .global).minY + 480: 480)
                }
                .frame(height: 480)

                VStack(alignment: .leading, spacing: 15) {
                    Text(anime.title)
                        .bold()
                        .font(.title)


                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(anime.genres, id: \.self) { genre in
                                Text(genre)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                        }
                    }

                    HStack {
                        Text(anime.status)
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(anime.currentStatus?.color ?? Color.blue)
                    }

                    Text("\(anime.averageScore)")

                    Text(anime.description
                        .replacingOccurrences(of: "<br>", with: "")
                        .replacingOccurrences(of: "<i>", with: ""))
                        .font(.caption)

                }
                .padding(.top,25)
                .padding(.horizontal)
                .edgesIgnoringSafeArea(.bottom)
                .background(Color.black.ignoresSafeArea())
                .offset(y: -35)
            }

        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.ignoresSafeArea(.all))
        .onAppear {
            vm.onTaskCalled()
        }
    }
}

#Preview {
    AnimeDetailView(viewModel: AnimeDetailViewModel(id: 2))
}
