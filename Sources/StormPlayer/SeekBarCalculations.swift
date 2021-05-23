//
//  SeekBarCalculations.swift
//  
//
//  Created by Sebastian Ceglarz on 21/05/2021.
//

import StormLibrary
import SwiftUI

public class SeekBarCalculations : StormLibraryObserver, StormPlayerViewObserver{
    
    private let stormPlayer : StormPlayer
    
    public var seekBarStartTime : Int64?
    public var seekBarEndTime : Int64?
    public var seekBarCurrTime : Int64?
    
    public var videoTimeData : TimeDataPacket.TimeData?
    
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.addObserver(self)
        self.stormPlayer.stormLibrary.addObserver(self)
    }
    
    public func onSeekBarSetValue(_ value: Float) {
        
        if self.videoTimeData != nil{
            
            let seekTime = valueToTime(value)
            self.stormPlayer.dispatchEvent(.onSeekBarSetTime, object: seekTime)
        }
        
    }
    
    public func onVideoProgress(videoTimeData: TimeDataPacket.TimeData) {
    
        self.videoTimeData = videoTimeData
   
        self.seekBarStartTime = videoTimeData.sourceStartTime + videoTimeData.sourceDuration - videoTimeData.dvrCacheSize
        self.seekBarEndTime = videoTimeData.sourceStartTime + videoTimeData.sourceDuration
        self.seekBarCurrTime = videoTimeData.streamStartTime + videoTimeData.streamDuration
        
        if self.seekBarCurrTime! > self.seekBarEndTime!{
            self.seekBarCurrTime = self.seekBarEndTime
        }
        
        refreshSeekBar()
    }
    
    public func refreshSeekBar(){
        if stormPlayer.playerViewState.seekBarIsSliding{
            return
        }
        
        if let unwrappedVideoTimeData = self.videoTimeData{
            if unwrappedVideoTimeData.dvrCacheSize < 1000*10{
                stormPlayer.playerViewState.isSeekBarVisible = false
            }else{
                stormPlayer.playerViewState.isSeekBarVisible = true
                
                let end = self.seekBarEndTime! - self.seekBarStartTime!
                let value = self.seekBarCurrTime! - self.seekBarStartTime!
                
                let seekBarValue = (Float(value) * 1)/Float(end)
                stormPlayer.playerViewState.seekBarValue = seekBarValue
            }
        }
    }
    
    public func valueToStringTime(_ value : Float) -> String {
        
        let liveString = NSLocalizedString("live", bundle: .module, comment: "x")
        
        let dvrTimeSeconds = valueToDvrTime(value)/1000
        return dvrTimeSeconds > 0 ? "-\(secondsToNiceTime(Int(dvrTimeSeconds)))" : liveString
        
    }

    public func valueToTime(_ value : Float) -> Int64{
        if let unwrappedEndTime = self.seekBarEndTime{
            return unwrappedEndTime - valueToDvrTime(value)
        }
        return 0
        
    }
    
    public func valueToDvrTime(_ value : Float) -> Int64{
        
        if let unwrappedVideoTimeData = self.videoTimeData{
            
            var percent = Int(value*100)
            percent = 100-percent
            
            let endTime = unwrappedVideoTimeData.dvrCacheSize
            let dvrTime = (endTime * Int64(percent))/100
            return dvrTime
            
        }
        return 0
    }
    
    public func secondsToNiceTime(_ seconds : Int) -> String{
        let minutes = (seconds % 3600) / 60
        let seconds = (seconds % 3600) % 60
        
        return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
    
}
