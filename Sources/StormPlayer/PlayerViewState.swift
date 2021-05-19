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
    @Published var isProgressBarVisible = true
    @Published var error : String?
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        stormPlayer.addObserver(self)
    }
    
    public func onPlayClicked(){
        error = "asd"
        //print("powinno zniknac ://///")
        //isGuiVisible = false
    }
    
    public func onPauseClicked(){
        error = nil
        //print("powinno zniknac ://///")
        //isGuiVisible = false
    }
}
