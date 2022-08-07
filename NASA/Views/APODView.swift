//
//  APODView.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.6
    case middle = 0.13
}

struct APODView: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    
    var nasa: NASA
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                let screenHeight = geo.size.height + geo.safeAreaInsets.top + geo.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                
                ZStack{
                    
                    Image("jwst1")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(height: geo.size.height, alignment: .bottom)
                    
                    Color.black.ignoresSafeArea().opacity(0.5)
                    
                    Text("Astronomy Photo of the Day").font(.largeTitle.weight(.bold)).frame(maxHeight: .infinity, alignment: .top).foregroundColor(Color.white).opacity(1 - bottomSheetTranslationProrated)
                    
                    Text(nasa.title).font(.largeTitle.weight(.bold)).foregroundColor(Color.white).offset(y: -250).opacity( bottomSheetTranslationProrated)
                    
                    Text(nasa.date).font(.title.weight(.bold)).foregroundColor(Color.white).offset(y: -200).opacity( bottomSheetTranslationProrated)
                    
                    AsyncImage(url: URL(string: nasa.url)) {
                        image in image
                            .resizable()
                            .frame(width: geo.size.width * 0.95, height: 400, alignment: .top).overlay{Rectangle().stroke(gradient, lineWidth: 1)}.offset(y: -bottomSheetTranslationProrated * imageOffset)
                        
                    } placeholder: {
                        
                        ProgressView()
                        
                    }
                    
                    
                    BottomSheetView(position: $bottomSheetPosition) {
                        //                        Text(bottomSheetTranslationProrated.formatted()).foregroundColor(Color.white).font(.title)
                        
                    } content: {
                        
                        ScrollView {
                            
                        }
                        .backgroundBlur(radius: 25, opaque: false)
                        RoundedRectangle(cornerRadius: 50)
                        
                            .opacity(0.1).frame(height: 900)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(gradient,lineWidth: 4))
                        
                        VStack (spacing: 10) {
                            
                            Text(Image(systemName: "chevron.compact.up")).fontWeight(.bold).font(.largeTitle)
                            
                            ZStack {
                                
                                Text("Description")
                                    .font(.largeTitle.weight(.bold))
                                    .opacity(bottomSheetTranslationProrated)
                                
                                VStack {
                            
                            Text(nasa.title).font(.title).offset(y: -bottomSheetTranslationProrated * imageOffset)
                            
                            Text(nasa.date).offset(y: -bottomSheetTranslationProrated * imageOffset)
                                    
                                }.offset(y: -20)
                                
                            }
                            
                            ScrollView {
                                
                                Text(nasa.explanation).padding()
                                
                            }
                            
                        }.foregroundColor(Color.white).offset(y: -10)
                        
                        
                    }.onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                    }
                    
                    
                }
            }
        }.gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                print(value.translation)
                switch(value.translation.width, value.translation.height) {
                    case (...0, -30...30):  print("left swipe")
                    case (0..., -30...30):  print("right swipe")
                case (-50...50, ...0):  bottomSheetPosition = .top
                case (-50...50, 0...):  bottomSheetPosition = .middle
                    default:  print("no clue")
                }
            }
        )
        .navigationBarHidden(true)
    }
}

struct APODView_Previews: PreviewProvider {
    static var previews: some View {
        APODView(nasa: previewNASA)
    }
}
