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
        ZStack(alignment: .bottom){
            FullscreenGateView(stormPlayer: stormPlayer)
        }.onAppear{

            do{
                try stormPlayer.stormLibrary.prepare()
            }catch let error as NSError {
                os_log("StormPlayer error: %@", log: .default, type: .error, String(describing: error))
            }
        }
        .environmentObject(stormPlayer.playerViewState!)
        
        
    }
    

   
}
