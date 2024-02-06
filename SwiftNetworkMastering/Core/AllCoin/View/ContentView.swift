//
//  ContentView.swift
//  SwiftNetworkMastering
//
//  Created by Kambiz on 2024-02-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinViewModel()

    var body: some View {
        VStack {
            if let error = viewModel.errorMessage {
                Text(error)
            } else {
                Text("\(viewModel.coin) : $\(viewModel.price)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
