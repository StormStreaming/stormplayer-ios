//
//  SeekBarCalculations.swift
//  
//
//  Created by Sebastian Ceglarz on 21/05/2021.
//

import StormLibrary

public class SeekBarCalculations : StormLibraryObserver{
    
    let stormPlayer : StormPlayer
    
    init(stormPlayer : StormPlayer){
        self.stormPlayer = stormPlayer
        self.stormPlayer.stormLibrary.addObserver(self)
    }
    
    /*
     obserwujemy update progressu i zbieramy dane potrzebne do kalkulacji
     */
    
    public func valueToTime(_ value : Float) -> String{
        return "00:0\(value)"
    }
    
}
