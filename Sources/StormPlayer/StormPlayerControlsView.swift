//
//  StormPlayerControlsView.swift
//  MyThirdApp
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import AVKit
import os.log
import StormLibrary

struct StormPlayerControlsView : View{
    
    let stormLibrary : StormLibrary
    
    let playPauseString = NSLocalizedString("playpause", bundle: .module, comment: "x")
    
    @State var seekPos : Float = 0

    var body: some View {
        
        /*
         OBRAZEK! :D
         */
        //Image("TestImage", bundle: .module)
        
        Button(playPauseString){
            
            if !stormLibrary.isPlaying{
                
                do{
                 try stormLibrary.play()
                } catch let error as NSError {
                    os_log("StormPlayer error: %@", log: .default, type: .error, String(describing: error))
                }
            }else{
                stormLibrary.pause()
            }
        }
        
        
        Button("Stop"){
            stormLibrary.stop()
        }

        ProgressBar(value: $seekPos).padding(20)
        
        //Slider(value: $seekPos, onEditingChanged: { _ in
        //})
        
    }
    
}
