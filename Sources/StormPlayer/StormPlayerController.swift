//
//  StormPlayerController.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import StormLibrary
import os.log

class StormPlayerController : StormPlayerViewObserver{
    
    let stormPlayer : StormPlayer
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.addObserver(self)
    }
    
    public func onPlayClicked(){
        do{
            try stormPlayer.stormLibrary.play()
        } catch let error {
            os_log("StormPlayer error: %@", log: .default, type: .error, String(describing: error))
        }
    }
    
    public func onPauseClicked(){
        stormPlayer.stormLibrary.pause()
    }
    
    public func testWithObject(_ t: String) {
        print("cntr: oho, otrzymalem wiadomosc: \(t)")
    }
}
