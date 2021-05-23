//
//  ProgressBarView.swift
//
//  Created by Sebastian Ceglarz on 17/05/2021.
//

import SwiftUI


struct SeekBarView : UIViewRepresentable{
    
    func makeCoordinator() -> SeekBarView.Coordinator {
        return SeekBarView.Coordinator(parent1: self)
    }
    
    @EnvironmentObject var playerViewState: PlayerViewState
    
    let stormSlider = StormUISliderView()
    
    func makeUIView(context: UIViewRepresentableContext<SeekBarView>) -> UISlider {
        
    
        stormSlider.minimumTrackTintColor = UIColor(Color("StormOrange", bundle: .module))
        stormSlider.maximumTrackTintColor = UIColor(Color("StormProgressBarInactive", bundle: .module))

        stormSlider.value = playerViewState.seekBarValue
        stormSlider.addTarget(context.coordinator, action: #selector(context.coordinator.changed(slider:)), for: .valueChanged)
        
        stormSlider.addTarget(context.coordinator, action: #selector(context.coordinator.sliderDidEndSliding(slider:)), for: [.touchUpInside, .touchUpOutside])
        
        return stormSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<SeekBarView>) {
        
        uiView.value = playerViewState.seekBarValue
    }
    
    class Coordinator : NSObject{

        var parent : SeekBarView
        
        init(parent1 : SeekBarView) {
            
            parent = parent1
        }
        
        @objc func changed(slider : StormUISliderView){
            
            if !parent.playerViewState.seekBarIsSliding{
                parent.playerViewState.seekBarIsSliding = true
            }

            slider.showTooltip()

            if slider.value > 0.97{
                slider.value = 1
            }
            
            slider.setToolTipValue(value: parent.playerViewState.stormPlayer.seekBarCalculations!.valueToStringTime(slider.value))
            
            

        }
        
        @objc func sliderDidEndSliding(slider : StormUISliderView) {
            slider.hideTooltip()
            parent.playerViewState.seekBarIsSliding = false
            parent.playerViewState.stormPlayer.dispatchEvent(.onSeekBarSetValue, object: slider.value)
            
        }
    }
    
}
