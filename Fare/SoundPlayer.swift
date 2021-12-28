//
//  SoundPlayer.swift
//  Fare
//
//  Created by Jumman Hossen on 03/12/21.
//

import Foundation
import AVFoundation

var audioplayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioplayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioplayer?.play()
        } catch{
            print("Could not find and play the sound file.")
        }
    }
}
