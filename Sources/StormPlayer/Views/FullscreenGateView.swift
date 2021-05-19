//
//  File.swift
//  
//
//  Created by Sebastian Ceglarz on 20/05/2021.
//

import SwiftUI


struct FullscreenGateView : View{
    
    public let stormPlayer : StormPlayer
    
    @EnvironmentObject var playerViewState: PlayerViewState

    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer

    }

    var body: some View {
        
        ZStack(alignment: .bottom){
            AVPlayerView(player: stormPlayer.stormLibrary.avPlayer)
            ControlsView(stormPlayer: stormPlayer)
        }.fullScreenCover(isPresented: playerViewState.isFullscreenMode ? .constant(true) : .constant(false)){
            FullscreenView(stormPlayer: stormPlayer)
        }
        
    }
    
}

struct FullscreenView: View {
    
    public let stormPlayer : StormPlayer
    

    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
    }
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .bottom){
            AVPlayerView(player: stormPlayer.stormLibrary.avPlayer)
            ControlsView(stormPlayer: stormPlayer)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
