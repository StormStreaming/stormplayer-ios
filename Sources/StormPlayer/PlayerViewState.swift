//
//  PlayerViewState.swift
//  
//
//  Created by Sebastian Ceglarz on 19/05/2021.
//

import SwiftUI

public class PlayerViewState : ObservableObject, PlayerViewObserver{
    
    let stormPlayer : StormPlayer
    
    @Published var isGuiVisible = true
    @Published var isFullscreenMode = false
    @Published var error : String?
    
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        stormPlayer.addObserver(self)
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
