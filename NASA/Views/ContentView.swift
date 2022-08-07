//
//  ContentView.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import SwiftUI



struct ContentView: View {
    
    var nasaModel = NASAModel()
    
    @State var nasa: NASA?
    
    var body: some View {

        if let nasa = nasa {
            
            APODView(nasa: nasa)
            
        } else {
            
            LoadingView()
                .task {
                    do {
                        nasa = try await nasaModel.getAPOD()
                    } catch {
                        print("Error getting APOD: \(error)")
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
