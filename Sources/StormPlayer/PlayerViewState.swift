//
//  PlayerViewState.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import SwiftUI
import StormLibrary

public class PlayerViewState : ObservableObject, PlayerViewObserver, StormLibraryObserver{
    
    let stormPlayer : StormPlayer
    
    @Published var isGuiVisible = true
    @Published var isFullscreenMode = false
    @Published var error : String?
    @Published var isPlaying = false
    
    var timer = Timer()
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        stormPlayer.addObserver(self)
        stormPlayer.stormLibrary.addObserver(self)
    }
    
    @objc public func hideGui(){
        isGuiVisible = false
    }
    
    private func startHideGuiTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideGui), userInfo: nil, repeats: false)
    }
    
    private func cancelHideGuiTimer(){
        timer.invalidate()
    }
    
    public func onVideoPlay() {
        isPlaying = true
        print("onVideoPlay")
        startHideGuiTimer()
    }
    
    public func onVideoPause() {
        isPlaying = false
        print("onVideoPause")
        cancelHideGuiTimer()
    }
    
    public func onVideoStop() {
        isPlaying = false
        print("onVideoStop")
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
        print("odpalilem enter")
        isFullscreenMode = true
    }
    
    public func onExitFullscreenClicked() {
        isFullscreenMode = false
    }
}
