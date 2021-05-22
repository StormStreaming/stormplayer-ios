//
//  LoaderDispatcher.swift
//  
//
//  Created by Sebastian Ceglarz on 22/05/2021.
//

import StormLibrary
import SwiftUI

public class LoaderDispatcher : StormLibraryObserver, StormPlayerViewObserver{
    
    private let stormPlayer : StormPlayer!
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.addObserver(self)
        self.stormPlayer.stormLibrary.addObserver(self)
    }
    

    public func onGatewayConnecting() {
        self.stormPlayer.playerViewState.isLoaderVisible = true
    }
    
    public func onVideoConnecting() {
        self.stormPlayer.playerViewState.isLoaderVisible = true
    }
    
    public func onVideoMetaData(videoMetaData: MetaDataPacket.MetaData) {
        self.stormPlayer.playerViewState.isLoaderVisible = false
    }
    
    public func onVideoPlay() {
        self.stormPlayer.playerViewState.isLoaderVisible = false
    }
    
    public func onErrorScreenShow() {
        self.stormPlayer.playerViewState.isLoaderVisible = false
    }
    
}
