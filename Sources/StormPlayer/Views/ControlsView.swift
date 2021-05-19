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
    
    let stormPlayer : StormPlayer
    let playPauseString = NSLocalizedString("playpause", bundle: .module, comment: "x")
    
    @State var seekPos : Float = 0

    var body: some View {
        
        /*
         Error Screen
         */
        if playerViewState.error != nil{
            Text("Error: \(playerViewState.error!)").foregroundColor(.white)
        }
        
        if playerViewState.error == nil && playerViewState.isGuiVisible{
            VStack{
            
            /*
             OBRAZEK! :D
             */
            //Image("TestImage", bundle: .module)
            
                HStack{
                    Spacer()
                    Button(playPauseString){
                        
                        if !stormPlayer.stormLibrary.isPlaying{
                            stormPlayer.dispatchEvent(.onPlayClicked)
                        }else{
                            stormPlayer.dispatchEvent(.onPauseClicked)
                            //stormPlayer.dispatchEvent(.testWithObject, object: "przekazuje wiadomosc :D")
                        }
                    }
                    Button("Fullscreen"){
                        if playerViewState.isFullscreenMode{
                            stormPlayer.dispatchEvent(.onExitFullscreenClicked)
                        }else{
                            stormPlayer.dispatchEvent(.onEnterFullscreenClicked)
                        }
                    }
                    .padding(.trailing, 20)
                }
            
                ProgressBar(value: $seekPos).padding(20)
            }
        }
        
   
        
    }
    
}
