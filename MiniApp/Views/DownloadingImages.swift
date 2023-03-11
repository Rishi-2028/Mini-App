//
//  DownloadingImages.swift
//  MiniApp
//
//  Created by Rishi on 11/03/2023.
//

import SwiftUI

// Codable
// Background Thread
// weak self
// Combine Framework
// Publishers and Subscribers
// FileManager
// Nscache

struct DownloadingImages: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadedImageInRow(model: model)
                }
            }
            .navigationTitle("Downloading Photos")
        }
    }
}

struct DownloadingImages_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImages()
    }
}
