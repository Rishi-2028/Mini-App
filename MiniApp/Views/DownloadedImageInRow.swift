//
//  DownloadedImageInRow.swift
//  MiniApp
//
//  Created by Rishi on 11/03/2023.
//

import SwiftUI

struct DownloadedImageInRow: View {
    let model: PhotoModel
    var body: some View {
        HStack {
            DownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

struct DownloadedImageInRow_Previews: PreviewProvider {
    static var previews: some View {
        DownloadedImageInRow(model: PhotoModel(albumId: 1, id: 1, title:"xyx", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/600/92c952"))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
