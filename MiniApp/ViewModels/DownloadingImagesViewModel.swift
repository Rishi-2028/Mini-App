//
//  DownloadingImagesViewModel.swift
//  MiniApp
//
//  Created by Rishi on 11/03/2023.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [PhotoModel] = []
    var cancellable = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$photoModels
            .sink { [weak self] (returnedPhotoModels) in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellable)
    }
    
}
