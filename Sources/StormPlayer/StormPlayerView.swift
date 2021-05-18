//
//  StormPlayer.swift
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import os.log
import StormLibrary

public struct StormPlayerView : View{
    
    let stormLibrary : StormLibrary
    
    public init(stormLibrary : StormLibrary){
        self.stormLibrary = stormLibrary
    }
    
    public var body: some View {
        VStack {
            AVPlayerView(player: stormLibrary.avPlayer)
            StormPlayerControlsView(stormLibrary: stormLibrary)
        }.onAppear{

            do{
                try stormLibrary.prepare()
            }catch let error as NSError {
                os_log("StormPlayer error: %@", log: .default, type: .error, String(describing: error))
            }
            
        }
      }
}
