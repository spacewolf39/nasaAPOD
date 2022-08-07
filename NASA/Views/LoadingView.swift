//
//  LoadingView.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ZStack {Image("jwst1").frame(width: 500)
                .aspectRatio(contentMode: .fit).ignoresSafeArea()
            
            VStack {
                
                Text("Astronomy Photo of the Day").fontWeight(.bold).font(.largeTitle).lineLimit(nil)
        
            ProgressView("Fetching NASA Data")
        
            }.foregroundColor(Color.white).frame(width: 400)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
