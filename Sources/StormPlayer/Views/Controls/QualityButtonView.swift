//
//  QualityButtonView.swift
//  
//
//  Created by Sebastian Ceglarz on 21/05/2021.
//

import SwiftUI

public struct QualityButtonView : View{
    
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    public var body: some View {
        
        if let qualityLabel = playerViewState.selectedQualityLabel{
            Button(action: {
                playerViewState.isQualityListVisible.toggle()
            })
            {
                
                    Text(qualityLabel)
                        .foregroundColor(.black)
                            .padding(5)
                        .font(.system(size: 11, weight: .heavy))
                

            }
            .background(Color.white)
            .cornerRadius(5)
            
        }
    }
    
}
