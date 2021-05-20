//
//  StormPlayer.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

import StormLibrary
import SwiftUI

public class StormPlayer{
    
    public let stormLibrary : StormLibrary
    
    private var libraryController : LibraryController?
    private var observations = [ObjectIdentifier : Observation]()
    
    public var playerViewState : PlayerViewState?
    
    public init(stormLibrary: StormLibrary){
        self.stormLibrary = stormLibrary
        self.libraryController = LibraryController(stormPlayer: self)
        self.playerViewState = PlayerViewState(stormPlayer: self);

    }
    
    public func enterFullscreen(){
        dispatchEvent(.onEnterFullscreenClicked)
    }
    
    public func exitFullscreen(){
        dispatchEvent(.onExitFullscreenClicked)
    }
   
    public func addObserver(_ observer: PlayerViewObserver){
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }
    
    public func removeObserver(_ observer: PlayerViewObserver){
        let id = ObjectIdentifier(observer)
        observations.removeValue(forKey: id)
    }

    public func dispatchEvent(_ eventType : EventType, object : Any? = nil){
        
        for (id, observation) in observations {
            
            guard let observer = observation.observer else {
                observations.removeValue(forKey: id)
                continue
            }
            switch eventType {
                case .onPlayClicked:
                    observer.onPlayClicked()
                case .onPauseClicked:
                    observer.onPauseClicked()
                case .onEnterFullscreenClicked:
                    observer.onEnterFullscreenClicked()
                case .onExitFullscreenClicked:
                    observer.onExitFullscreenClicked()
                case .onVideoClicked:
                    observer.onVideoClicked()
                case .testWithObject:
                    observer.testWithObject((object as? String)!)
            }
        }
    }
    
    public struct Observation {
        weak var observer: PlayerViewObserver?
    }
    
}
