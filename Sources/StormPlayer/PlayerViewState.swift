//
//  PlayerViewState.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import SwiftUI
import StormLibrary

public class PlayerViewState : ObservableObject, StormPlayerViewObserver, StormLibraryObserver{
    
    let HIDE_GUI_DELAY = 2.5
    
    let stormPlayer : StormPlayer
    
    @Published var isGuiVisible = true
    @Published var isLoaderVisible = true
    @Published var isSeekBarVisible = false
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
            if seekBarIsSliding{
                cancelHideGuiTimer()
            }else{
                startHideGuiTimer()
            }
        }
    }
    @Published var seekBarValue : Float = 1
    
    
    var timer = Timer()
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        stormPlayer.addObserver(self)
        stormPlayer.stormLibrary.addObserver(self)
        
        refreshQualityList()
    
    }
    
    @objc public func hideGui(){
        isGuiVisible = false
    }
    
    private func refreshQualityList(){
        var list : [String] = []
        for (_, stormMediaItem) in stormPlayer.stormLibrary.stormMediaItems.enumerated(){
            list.append(stormMediaItem.label)
            if stormMediaItem.isSelected{
                selectedQualityLabel = stormMediaItem.label
            }
        }
        qualitiesList = list
    }
    
    private func startHideGuiTimer(){
        if !isPlaying{
            return;
        }
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: HIDE_GUI_DELAY, target: self, selector: #selector(hideGui), userInfo: nil, repeats: false)
    }
    
    private func cancelHideGuiTimer(){
        timer.invalidate()
    }
    
    
    //Library Events
    
    public func onVideoPlay() {
        isPlaying = true
        startHideGuiTimer()
    }
    
    public func onVideoPause() {
        isGuiVisible = true
        isPlaying = false
        cancelHideGuiTimer()
    }
    
    public func onVideoStop() {
        isPlaying = false
    }
    
    public func onStormMediaItemAdded(stormMediaItem: StormMediaItem) {
        refreshQualityList()
    }
    
    public func onStormMediaItemRemoved(stormMediaItem: StormMediaItem) {
        refreshQualityList()
    }
    
    public func onStormMediaItemSelect(stormMediaItem: StormMediaItem) {
        refreshQualityList()
        selectedQualityLabel = stormMediaItem.label
        isQualityListVisible = false
    }
    
    //Player Events
    
    public func onVideoClicked(){
        if !isGuiVisible{
            isGuiVisible = true
            startHideGuiTimer()
        }else{
            isGuiVisible = false
        }
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
    
    
    public func onSeekBarSetValue(_ value: Float) {
        seekBarValue = value
        print("value: \(seekBarValue)")
    }
}
