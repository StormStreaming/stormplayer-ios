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
            AVPlayerView(player: playerViewState.stormPlayer.stormLibrary.getAvPlayer()).onTapGesture {
                playerViewState.stormPlayer.dispatchEvent(.onVideoClicked)
            }
            
            ZStack{
                if playerViewState.isGuiVisible{
                    PlaybackButtonView()
                    ControlsView()
                }
            }
        }.fullScreenCover(isPresented: playerViewState.isFullscreenMode ? .constant(true) : .constant(false)){
            FullscreenView().environmentObject(playerViewState)
        }
            }
    

}

struct FullscreenView: View {
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    var body: some View {
        ZStack(alignment: .bottom){
            AVPlayerView(player: playerViewState.stormPlayer.stormLibrary.getAvPlayer()).onTapGesture {
                playerViewState.stormPlayer.dispatchEvent(.onVideoClicked)
            }
            
            ZStack{
                if playerViewState.isGuiVisible{
                    PlaybackButtonView()
                    ControlsView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
