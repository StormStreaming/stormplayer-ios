//
//  StormPlayerController.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import StormLibrary
import os.log

class LibraryController : StormPlayerViewObserver{
    
    let stormPlayer : StormPlayer
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.addObserver(self)
    }
    
    public func onPlayClicked(){
        do{
            try stormPlayer.stormLibrary.play()
        } catch let error {
            os_log("Play error: %@", log: .stormPlayer, type: .error, String(describing: error))
        }
    }
    
    public func onPauseClicked(){
        stormPlayer.stormLibrary.pause()
    }
    
    public func onQualitySelect(_ quality: String) {
        for(_, item) in stormPlayer.stormLibrary.stormMediaItems.enumerated(){
            if item.label == quality{
                stormPlayer.stormLibrary.selectStormMediaItem(stormMediaItem: item, play: true, resetSeekPosition: false)
                break;
            }
        }
    }
    
    func onSeekBarSetTime(_ seekTime: Int64) {
        do{
            try stormPlayer.stormLibrary.seekTo(seekTime: seekTime)
        } catch let error {
            os_log("SeekTo error: %@", log: .stormPlayer, type: .error, String(describing: error))
        }
    }
}
