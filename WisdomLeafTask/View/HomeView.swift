//
//  ContentView.swift
//  WisdomLeafTask
//
//  Created by Aman Jain on 13/05/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct HomeView: View {
    @StateObject private var viewModel = DataInfoViewModel()
    
    var body: some View {
        List(viewModel.images, id: \.id) { image in
            HStack {
                AsyncImage(url: URL(string: image.downloadURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "xmark.square")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    @unknown default:
                        fatalError("Unknown AsyncImage phase")
                    }
                }
                .frame(width: 200, height: 200)
                // Display image, title, description
                
                VStack(spacing: 10){
                    Text(image.author)
                    
                    Text(image.url)
                }
                
            }
            .frame(maxWidth: .infinity , alignment: .leading)
        }
        .onAppear {
            viewModel.fetchImages()
        }
        .refreshable {
            await Task.sleep(2_000_000_000)
            viewModel.fetchImages()
            print("Do your refresh work here")
        }
    }
    
}
