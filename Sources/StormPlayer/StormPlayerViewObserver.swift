//
//  StormPlayerViewObserver.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

public protocol StormPlayerViewObserver: AnyObject {
    func onPlayClicked()
    func onPauseClicked()
    func testWithObject(_ t : String)
}

public extension StormPlayerViewObserver {
    func onPlayClicked() {}
    func onPauseClicked() {}
    func testWithObject(_ t : String) {}
}
