//
//  DataInfoViewModel.swift
//  WisdomLeafTask
//
//  Created by Aman Jain on 15/05/23.
//

import SwiftUI

@available(iOS 13.0, *)
class DataInfoViewModel: ObservableObject {
    @Published var images = [DataInfo]()
    
    func fetchImages() {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=20") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching images: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let imagesData = try decoder.decode([DataInfo].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.images = imagesData
                    }
                } catch {
                    print("Error decoding images data: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
