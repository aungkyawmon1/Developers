//
//  PlaySound.swift
//  Developers
//
//  Created by solinx on 28/09/2023.
//

import Foundation
import AVFoundation

// MARK: - AUDIO PLAYER

var audioPlayer: AVAudioPlayer?

func playSound(soundName: String, type: String) {
    if let path = Bundle.main.path(forResource: soundName, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
