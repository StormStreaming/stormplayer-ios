//
//  ProgressBar.swift
//  MyThirdApp
//
//  Created by Sebastian Ceglarz on 17/05/2021.
//

import SwiftUI


struct ProgressBar : UIViewRepresentable{
    
    func makeCoordinator() -> ProgressBar.Coordinator {
        return ProgressBar.Coordinator(parent1: self)
    }
    
    @Binding var value : Float
    let stormSlider = StormUISlider()
    
    func makeUIView(context: UIViewRepresentableContext<ProgressBar>) -> UISlider {
        
    
        stormSlider.minimumTrackTintColor = UIColor(Color("StormOrange", bundle: .module))
        stormSlider.maximumTrackTintColor = UIColor(Color("StormProgressBarInactive", bundle: .module))

        //stormSlider.thumbTintColor = UIColor(Color("StormOrange", bundle: .module))

        //slider.setThumbImage(UIImage(named: "thumb"), for: .normal)
        stormSlider.value = value
        stormSlider.addTarget(context.coordinator, action: #selector(context.coordinator.changed(slider:)), for: .valueChanged)
        
        stormSlider.addTarget(context.coordinator, action: #selector(context.coordinator.sliderDidEndSliding(slider:)), for: [.touchUpInside, .touchUpOutside])
        
        return stormSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: UIViewRepresentableContext<ProgressBar>) {
        
        uiView.value = value
    }
    
    class Coordinator : NSObject{
        
        var parent : ProgressBar
        
        init(parent1 : ProgressBar) {
            
            parent = parent1
        }
        
        @objc func changed(slider : StormUISlider){
            print("value: \(slider.value)")
            
            slider.showTooltip()

            if slider.value > 0.97{
                slider.value = 1
                slider.setToolTipValue(value: "LIVE")
            }else{
                slider.setToolTipValue(value: "00:00")
            }
            
        }
        
        @objc func sliderDidEndSliding(slider : StormUISlider) {
            slider.hideTooltip()
        }
    }
    
}
