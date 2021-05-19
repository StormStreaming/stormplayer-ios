//
//  StormPlayerViewObserver.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

public protocol PlayerViewObserver: AnyObject {
    func onPlayClicked()
    func onPauseClicked()
    func testWithObject(_ t : String)
}

public extension PlayerViewObserver {
    func onPlayClicked() {}
    func onPauseClicked() {}
    func testWithObject(_ t : String) {}
}

public extension StormPlayer{
    enum EventType {
        case onPlayClicked
        case onPauseClicked
        case testWithObject
    }
}
