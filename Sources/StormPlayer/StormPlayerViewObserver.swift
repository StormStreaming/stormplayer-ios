//
//  StormPlayerViewObserver.swift
//  
//
//  Created by Sebastian Ceglarz on 18/05/2021.
//

public protocol StormPlayerViewObserver: AnyObject {
    func onPlayClicked()
    func onPauseClicked()
    func onEnterFullscreenClicked()
    func onExitFullscreenClicked()
    func onVideoClicked()
    func onQualitySelect(_ quality : String)
    func onSeekBarSetValue(_ value : Float)
    func onSeekBarSetTime(_ seekTime : Int64)
    func onErrorScreenShow(_ message : String)
    func onErrorScreenHide()

}

public extension StormPlayerViewObserver {
    func onPlayClicked() {}
    func onPauseClicked() {}
    func onEnterFullscreenClicked() {}
    func onExitFullscreenClicked() {}
    func onVideoClicked() {}
    func onQualitySelect(_ quality : String) {}
    func onSeekBarSetValue(_ value : Float) {}
    func onSeekBarSetTime(_ seekTime : Int64){}
    func onErrorScreenShow(_ message : String){}
    func onErrorScreenHide(){}
}

public extension StormPlayer{
    enum EventType {
        case onPlayClicked
        case onPauseClicked
        case onEnterFullscreenClicked
        case onExitFullscreenClicked
        case onVideoClicked
        case onQualitySelect
        case onSeekBarSetValue
        case onErrorScreenShow
        case onSeekBarSetTime
        case onErrorScreenHide
    }
}
