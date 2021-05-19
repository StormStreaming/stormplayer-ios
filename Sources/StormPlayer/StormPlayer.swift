//
//  StormPlayer.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

import StormLibrary

public class StormPlayer{
    
    public let stormLibrary : StormLibrary
    
    private var stormPlayerController : StormPlayerController?
    private var observations = [ObjectIdentifier : Observation]()
    
    public init(stormLibrary: StormLibrary){
        self.stormLibrary = stormLibrary
        self.stormPlayerController = StormPlayerController(stormPlayer: self)
    }
    
    public enum EventType {
        case onPlayClicked
        case onPauseClicked
        case testWithObject
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
                case .onPauseClicked:
                    observer.onPauseClicked()
                case .testWithObject:
                    observer.testWithObject((object as? String)!)
            }
        }
    }
    
    public struct Observation {
        weak var observer: StormPlayerViewObserver?
    }
    
}
