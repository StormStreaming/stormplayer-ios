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

        PlayerView()
            .fullScreenCover(isPresented: playerViewState.isFullscreenMode ? .constant(true) : .constant(false)){
                FullscreenView().environmentObject(playerViewState)
        }
    }

}

struct FullscreenView: View {
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    var body: some View {
        PlayerView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct PlayerView : View{
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    var body: some View {
        
        if playerViewState.error != nil{
            ZStack{
                Color.black
                VStack(alignment: .center){
                    Image("Error", bundle: .module)
                        .padding(.bottom, 20)
                    Text(playerViewState.error!)
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        
                }
            }
        }else{
            ZStack{
                ZStack(alignment: .bottom){
                    AVPlayerView(player: playerViewState.stormPlayer.stormLibrary.getAvPlayer()).onTapGesture {
                        playerViewState.stormPlayer.dispatchEvent(.onVideoClicked)
                    }
                    
                    ZStack{
                        if playerViewState.isGuiVisible{
                            if !playerViewState.isLoaderVisible{
                                PlaybackButtonView()
                            }
                            ControlsView()
                        }
                    }
                }
                
                if playerViewState.isLoaderVisible{
                    ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("StormOrange", bundle: .module)))
                        .scaleEffect(2)
                }
            }
        }
    }
}
