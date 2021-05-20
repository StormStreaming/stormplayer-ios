//
//  StormPlayerControlsView.swift
//  MyThirdApp
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import AVKit
import StormLibrary

struct ControlsView : View{
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    let playPauseString = NSLocalizedString("playpause", bundle: .module, comment: "x")
    
    @State var seekPos : Float = 0

    var body: some View {
        
        /*
         Error Screen
         */
        if playerViewState.error != nil{
            Text("Error: \(playerViewState.error!)").foregroundColor(.white)
        }
        
        VStack{

            Spacer()
            PlaybackButtonView()
            Spacer()
            if playerViewState.error == nil && playerViewState.isGuiVisible{
                VStack{
                
                /*
                 OBRAZEK! :D
                 */
                //Image("TestImage", bundle: .module)
                
                    HStack{
                        Spacer()
                        FullScreenButtonView()
                        .padding(.trailing, 20)
                    }
                
                    ProgressBarView(value: $seekPos).padding(20)
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            
   
        
    }
    
}
