//
//  TabView.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import SwiftUI

struct TabView: View {
    
    var action: () -> Void
    
    var body: some View {
        
        ZStack {
            Arc().fill(darkPurple).frame(height: 88)
                .overlay{
                    Arc().stroke(gradient, lineWidth: 1)
                }
            
        
            HStack {
                // Button one
                Button {
                    action()
                } label: {
                    Image(systemName: "moon").frame(width: 60, height: 60)
                }
                
                Spacer()
                // Button two
                
                NavigationLink {
                    
                } label: {
                    Image(systemName: "phone")
                }.frame(width: 60, height: 60)

            }.font(.title2).foregroundColor(Color.white)
            
        }.frame(maxHeight: .infinity, alignment: .bottom).ignoresSafeArea().padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(action: {})
            .preferredColorScheme(.dark)
    }
}
