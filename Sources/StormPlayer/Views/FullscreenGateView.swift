//
//  File.swift
//  
//
//  Created by Sebastian Ceglarz on 20/05/2021.
//

import SwiftUI


struct FullscreenGateView : View{
    

    @EnvironmentObject var playerViewState: PlayerViewState

    var body: some View {
        
        ZStack(alignment: .bottom){
            AVPlayerView(player: playerViewState.stormPlayer.stormLibrary.avPlayer).onTapGesture {
                playerViewState.stormPlayer.dispatchEvent(.onVideoClicked)
            }
            if playerViewState.isGuiVisible{
                ControlsView()
            }
        }.fullScreenCover(isPresented: playerViewState.isFullscreenMode ? .constant(true) : .constant(false)){
            FullscreenView()
        }
        
    }
    
}

struct FullscreenView: View {
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    var body: some View {
        ZStack(alignment: .bottom){
            AVPlayerView(player: playerViewState.stormPlayer.stormLibrary.avPlayer)
            ControlsView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
