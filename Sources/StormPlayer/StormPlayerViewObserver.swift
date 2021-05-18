//
//  File.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

import Foundation

public protocol StormPlayerViewObserver: AnyObject {
    func playClicked()
    func testWithObject(_ t : String)
}

public extension StormPlayerViewObserver {
    func playClicked() {}
    func testWithObject(_ t : String) {}
}
