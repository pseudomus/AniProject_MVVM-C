//
//  Network.swift
//  AniList
//
//  Created by Luca Lacerda on 15/04/25.
//

import Foundation
import Apollo

class Network {

    static let shared = Network()

    private init() {}

    private(set) lazy var apolloClient: ApolloClient = {
        let url = URL(string:"https://graphql.anilist.co")!
        let store = ApolloStore()
        let provider = DefaultInterceptorProvider(store: store)
        let transport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url)
        return ApolloClient(networkTransport: transport, store: store)
    }()
}
