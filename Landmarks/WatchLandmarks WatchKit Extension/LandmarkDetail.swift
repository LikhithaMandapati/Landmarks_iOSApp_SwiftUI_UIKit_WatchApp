//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Likhitha Mandapati on 9/9/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    
    var body: some View {
        //@Bindable var modelData = modelData
        
        NavigationView {
            ScrollView {
                VStack {
                    CircleImage(image: landmark.image.resizable())
                        .scaledToFit()
                    
                    Text(landmark.name)
                        .font(.headline)
                        .lineLimit(0)
                    
                    
                    Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                        Text("Favorite")
                    }
                    
                    
                    Divider()
                    
                    
                    Text(landmark.park)
                        .font(.caption)
                        .bold()
                        .lineLimit(0)
                    
                    
                    Text(landmark.state)
                        .font(.caption)
                    
                    Divider()
                    
                    
                    MapView(coordinate: landmark.locationCoordinate)
                        .scaledToFit()
                }
                .padding(16)
            }
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
