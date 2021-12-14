//
//  AudioPlayer.swift
//  SwiftUI_P1
//
//  Created by Aybatu Kerküklüoğlu on 14/12/2021.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAudio(sound: String, type: String) {
   
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Audio couldn't be found")
        }
    }
}

