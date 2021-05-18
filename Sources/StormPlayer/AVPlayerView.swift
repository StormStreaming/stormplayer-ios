//
//  AVPlayerView.swift
//
//  Created by Sebastian Ceglarz on 10/05/2021.
//

import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AVPlayerView>) -> AVPlayerViewController{
        let controller = AVPlayerViewController()
        controller.player = player
        //controller.showsPlaybackControls = false
        return controller;
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
