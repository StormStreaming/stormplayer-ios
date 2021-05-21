//
//  StormPlayer.swift
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import os.log

public struct StormPlayerView : View{
    
    public let stormPlayer : StormPlayer
    
    public init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
    }
    
    public var body: some View {
        FullscreenGateView()
        .environmentObject(stormPlayer.playerViewState!)
        
    }
    

   
}
