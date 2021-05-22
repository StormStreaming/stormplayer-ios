//
//  StormPlayerControlsView.swift
//  MyThirdApp
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import AVKit
import StormLibrary

struct ControlsView : View{
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    @State var seekPos : Float = 0

    var body: some View {
        
        VStack{

            Spacer()

            if playerViewState.isQualityListVisible{
                QualitySelectView().padding(.top, 80)
            }
            
            if playerViewState.error == nil && playerViewState.isGuiVisible{
                VStack{
                
                /*
                 OBRAZEK! :D
                 */
                //Image("TestImage", bundle: .module)
                
                    HStack{
                        Spacer()
                        
                        if playerViewState.isQualityButtonVisible{
                            QualityButtonView()
                            .padding(.trailing, 10)
                        }
                        
                        FullScreenButtonView()
                        .padding(.trailing, 20)
                    }
                
                    SeekBarView().padding(20)
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            
   
        
    }
    
}
