//
//  PlayerViewState.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import SwiftUI
import StormLibrary

public class PlayerViewState : ObservableObject, StormPlayerViewObserver, StormLibraryObserver{
    
    let stormPlayer : StormPlayer
    
    @Published var isGuiVisible = true
    @Published var isFullscreenMode = false
    @Published var error : String?
    @Published var isPlaying = false
    @Published var isQualityButtonVisible = false
    @Published var isQualityListVisible = false {
        didSet{
            if isQualityListVisible{
                cancelHideGuiTimer()
            }else{
                startHideGuiTimer()
            }
        }
    }
    @Published var selectedQualityLabel : String?
    @Published var qualitiesList : [String] = [] {
        didSet{
            if qualitiesList.count <= 1{
                isQualityListVisible = false
                isQualityButtonVisible = false
            }else{
                isQualityButtonVisible = true
            }
        }
    }
    
    @Published var seekBarIsSliding = false{
        didSet{
            print("Is sliding: \(seekBarIsSliding)")
            /*
             
             BLOKUJEMY UPDATE SLIDERA Z EVENTU LIBRARKI
             
             */
        }
    }
    @Published var seekBarValue : Float = 1
    
    
    var timer = Timer()
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        stormPlayer.addObserver(self)
        stormPlayer.stormLibrary.addObserver(self)
        
        qualitiesList.append("1080p")
        qualitiesList.append("4k")
        selectedQualityLabel = "4k"
    }
    
    @objc public func hideGui(){
        isGuiVisible = false
    }
    
    private func startHideGuiTimer(){
        if !isPlaying{
            return;
        }
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideGui), userInfo: nil, repeats: false)
    }
    
    private func cancelHideGuiTimer(){
        timer.invalidate()
    }
    
    public func onVideoPlay() {
        isPlaying = true
        startHideGuiTimer()
    }
    
    public func onVideoPause() {
        isPlaying = false
        cancelHideGuiTimer()
    }
    
    public func onVideoStop() {
        isPlaying = false
    }
    
    public func onVideoClicked(){
        isGuiVisible = true
        startHideGuiTimer()
    }
    
    public func onPlayClicked(){
        //isFullscreenMode = true
        //print("powinno zniknac ://///")
        //isGuiVisible = false
    }
    
    public func onPauseClicked(){
        
        //print("powinno zniknac ://///")
        //isGuiVisible = false
    }
    
    public func onEnterFullscreenClicked() {
        isFullscreenMode = true
    }
    
    public func onExitFullscreenClicked() {
        isFullscreenMode = false
    }
    
    public func onQualitySelect(_ quality : String) {
        selectedQualityLabel = quality
        isQualityListVisible = false
    }
    
    public func onSeekBarSetValue(_ value: Float) {
        seekBarValue = value
        print("value: \(seekBarValue)")
    }
}
