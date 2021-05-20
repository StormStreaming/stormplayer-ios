//
//  FullScreenButtonView.swift
//  
//
//  Created by Sebastian Ceglarz on 20/05/2021.
//

import SwiftUI

public struct FullScreenButtonView : View{
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    public var body: some View {
        
        Button(action: {
            if playerViewState.isFullscreenMode{
                playerViewState.stormPlayer.dispatchEvent(.onExitFullscreenClicked)
            }else{
                playerViewState.stormPlayer.dispatchEvent(.onEnterFullscreenClicked)
            }

        }) {            Image(playerViewState.isFullscreenMode ? "ExitFullscreen" : "EnterFullscreen", bundle: .module)
        }
        
    }
    

   
}
