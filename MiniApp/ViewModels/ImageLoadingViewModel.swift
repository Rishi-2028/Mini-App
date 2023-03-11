//
//  ImageLoadingViewModel.swift
//  MiniApp
//
//  Created by Rishi on 11/03/2023.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    let urlString: String
    let imageKey: String
    
    let manager = PhotoModelCacheManager.instance
    
    var cancellable = Set<AnyCancellable>()
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
        
    }
    
  
    func getImage() {
        
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting Saved Image")
        } else {
            downloadImage()
            print("Downloading Image")
        }
    }
    
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            
            return
            
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink {[weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else {return}
                
                    self.image = image
                self.manager.add(key: self.imageKey, value: image)
                
            }
            .store(in: &cancellable)

        
    }
   
    
    
}
