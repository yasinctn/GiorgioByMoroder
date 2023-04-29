//
//  SoundPlayer.swift
//  Giorgio
//
//  Created by Yasin Cetin on 29.04.2023.
//

import Foundation
import AVFoundation

class SoundPlayer: ObservableObject {
    
    private var audioPlayer : AVAudioPlayer?
    
    func playSound(soundName: String, type: String) {
        
        if let path = Bundle.main.path(forResource: soundName, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
                audioPlayer!.play()
                audioPlayer?.numberOfLoops = 5
            }catch {
                print("could not play sound")
            }
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
    }
}
