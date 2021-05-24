//
//  ErrorDispatcher.swift
//  
//
//  Created by Sebastian Ceglarz on 22/05/2021.
//

import StormLibrary
import SwiftUI

public class ErrorDispatcher : StormLibraryObserver{
    
    private let stormPlayer : StormPlayer!
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.stormLibrary.addObserver(self)
    }
    
    public func onVideoConnecting() {
        stormPlayer.playerViewState.error = nil
    }
    
    public func onGatewayConnecting() {
        stormPlayer.playerViewState.error = nil
    }
    
    public func onStormMediaItemAdded(stormMediaItem: StormMediaItem) {
        stormPlayer.playerViewState.error = nil
    }
    
    
    public func onVideoStop() {
        stormPlayer.playerViewState.error = NSLocalizedString("videoStopText", bundle: .module, comment: "x")
    }
    
    public func onVideoNotFound(){
        stormPlayer.playerViewState.error = NSLocalizedString("videoNotFoundText", bundle: .module, comment: "x")
    }
    
    public func onIncompatiblePlayerProtocol() {
        stormPlayer.playerViewState.error = NSLocalizedString("incompatiblePlayerProtocolText", bundle: .module, comment: "x")
    }
    
    public func onVideoConnectionError(error: Error) {
        stormPlayer.playerViewState.error = NSLocalizedString("connectionErrorText", bundle: .module, comment: "x")
    }
    
    public func onGatewayGroupNameNotFound() {
        stormPlayer.playerViewState.error = NSLocalizedString("videoNotFoundText", bundle: .module, comment: "x")
    }
        public func onGatewayConnectionError(error : Error) {
        stormPlayer.playerViewState.error = NSLocalizedString("connectionErrorText", bundle: .module, comment: "x")
    }
    
    
}

