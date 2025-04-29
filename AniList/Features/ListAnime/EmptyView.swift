//
//  EmptyView.swift
//  AniList
//
//  Created by Luca Lacerda on 25/04/25.
//

import SwiftUI

struct EmptyView: View{

    var body: some View{
        VStack {
            Spacer()
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("Lista vazia")
                .padding()
            Spacer()
        }
    }
}

#Preview {
    EmptyView()
}
