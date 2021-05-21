//
//  QualitySelectView.swift
//  
//
//  Created by Sebastian Ceglarz on 21/05/2021.
//

import SwiftUI

public struct QualitySelectView : View{
 
    @EnvironmentObject var playerViewState: PlayerViewState
    
    @State private var selectedQualityIndex = 0
    

    public var body: some View {
        
        HStack{
            Spacer()
            VStack{
                
                ForEach(playerViewState.qualitiesList, id: \.self){ quality in
                    let index = playerViewState.qualitiesList.firstIndex(of: quality)
                    
                    Button(action: {
                        playerViewState.stormPlayer.dispatchEvent(.onQualitySelect, object: quality)
                    })
                    {
                        HStack{
                            
                            Text(quality)
                                .foregroundColor(.white)
                                .padding(.top, 5)
                                .padding(.bottom, 5)
                                .font(.system(size: 16))
                            
                            if let selectedQualityLabel = playerViewState.selectedQualityLabel{
                                if selectedQualityLabel == quality{
                                    HStack{
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 10, height: 10)
                                    }
                                }
                            }
                            
                                
                        }
                        .padding(.leading, 10)
                        .frame(width: 95, height: 30, alignment: .leading)
                    

                    }
                    .frame(width: 95, height: 30, alignment: .leading)
                    .padding(.top, index == 0 ? 3 : 0)
                    .padding(.bottom, index == playerViewState.qualitiesList.count-1 ? 3 : 0)
                    
                    if index != playerViewState.qualitiesList.count-1 {
                    Divider()
                        .frame(width: 100, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.white.opacity(0.4))
                    }

                }
                
            }
            .background(Color.black.opacity(0.3))
            .cornerRadius(5)
            .padding(.trailing, 30)
            .padding(.bottom, 10)
            
        }
        
        
    }
    
}
