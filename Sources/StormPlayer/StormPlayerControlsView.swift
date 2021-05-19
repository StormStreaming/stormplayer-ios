//
//  StormPlayerControlsView.swift
//  MyThirdApp
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import AVKit
import StormLibrary

struct StormPlayerControlsView : View{
    
    let stormPlayer : StormPlayer
    
    let playPauseString = NSLocalizedString("playpause", bundle: .module, comment: "x")
    
    @State var seekPos : Float = 0

    var body: some View {
        
        /*
         OBRAZEK! :D
         */
        //Image("TestImage", bundle: .module)
        
        Button(playPauseString){
            
            if !stormPlayer.stormLibrary.isPlaying{
                stormPlayer.dispatchEvent(.onPlayClicked)
            }else{
                stormPlayer.dispatchEvent(.onPauseClicked)
                //stormPlayer.dispatchEvent(.testWithObject, object: "przekazuje wiadomosc :D")
            }
        }
        
        
        //Button("Stop"){
        //    stormPlayer.stormLibrary.stop()
        //}

        ProgressBar(value: $seekPos).padding(20)
        
        //Slider(value: $seekPos, onEditingChanged: { _ in
        //})
        
    }
    
}
