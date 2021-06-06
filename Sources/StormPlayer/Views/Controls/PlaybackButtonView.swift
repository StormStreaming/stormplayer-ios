//
//  PlaybackButtonView.swift
//  
//
//  Created by Sebastian Ceglarz on 20/05/2021.
//

import SwiftUI

public struct PlaybackButtonView : View{
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    public var body: some View {
        
        Button(action: {
            if !playerViewState.isPlaying{
                playerViewState.stormPlayer.dispatchEvent(.onPlayClicked)
            }else{
                playerViewState.stormPlayer.dispatchEvent(.onPauseClicked)
            }        }) {
            Image(!playerViewState.isPlaying ? "Play" : "Pause", bundle: .module)
                .resizable()
                .frame(width: 72, height: 72, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

        }
        
    }
    
}
