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
    
    private var libraryController : LibraryController!
    private var observations = [ObjectIdentifier : Observation]()
    
    public var playerViewState : PlayerViewState!
    public var seekBarCalculations : SeekBarCalculations!
    public var errorDispatcher : ErrorDispatcher!
    public var loaderDispatcher : LoaderDispatcher!
    
    public init(stormLibrary: StormLibrary){
        self.stormLibrary = stormLibrary
        self.libraryController = LibraryController(stormPlayer: self)
        self.playerViewState = PlayerViewState(stormPlayer: self);
        self.seekBarCalculations = SeekBarCalculations(stormPlayer: self);
        self.errorDispatcher = ErrorDispatcher(stormPlayer: self)
        self.loaderDispatcher = LoaderDispatcher(stormPlayer: self)

    }
    
    public func enterFullscreen(){
        dispatchEvent(.onEnterFullscreenClicked)
    }
    
    public func exitFullscreen(){
        dispatchEvent(.onExitFullscreenClicked)
    }
   
    public func addObserver(_ observer: StormPlayerViewObserver){
        let id = ObjectIdentifier(observer)
        observations[id] = Observation(observer: observer)
    }
    
    public func removeObserver(_ observer: StormPlayerViewObserver){
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
                    break
                case .onPauseClicked:
                    observer.onPauseClicked()
                    break
                case .onEnterFullscreenClicked:
                    observer.onEnterFullscreenClicked()
                    break
                case .onExitFullscreenClicked:
                    observer.onExitFullscreenClicked()
                    break
                case .onVideoClicked:
                    observer.onVideoClicked()
                    break
                case .onQualitySelect:
                    observer.onQualitySelect((object as? String)!)
                    break
                case .onSeekBarSetValue:
                    observer.onSeekBarSetValue((object as? Float)!)
                    break
                case .onErrorScreenShow:
                    observer.onErrorScreenShow()
                    break
                case .onSeekBarSetTime:
                    observer.onSeekBarSetTime((object as? Int64)!)
                    break
            }
        }
    }
    
    public struct Observation {
        weak var observer: StormPlayerViewObserver?
    }
    
}
