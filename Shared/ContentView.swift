//
//  ContentView.swift
//  Shared
//
//  Created by user206250 on 10/11/21.
//

import SwiftUI
import AVFoundation
import AVKit

var audioPlayer: AVAudioPlayer!

let birds = ["Kirjosieppo", "Varis",
            "Talitintti", "Harakka",
            "Lokki"]

let flycatcherSound = NSDataAsset(name: "mac_flycatcher")
let crowSound = NSDataAsset(name: "mac_crow")
let greatTitSound = NSDataAsset(name: "mac_great_tit")
let magpieSound = NSDataAsset(name: "mac_magpie")
let seagullSound = NSDataAsset(name: "mac_seagull")

let birdSounds = [flycatcherSound, crowSound,
                greatTitSound, magpieSound,
                seagullSound]


struct ContentView: View {
    @State var birdIndex = 0;
    var body: some View {
        
        HStack(
            alignment: .top,
            spacing: 10
        ) {
            Button{
                //Play sound
                print("Played sound")
                
                guard let url = Bundle.main.url(forResource: "mac_flycatcher", withExtension: "mp3") else { return }
                
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)
                    audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    
                    guard let audioPlayer = audioPlayer else { return }
                    
                    audioPlayer.play()
                    
                } catch let error {
                    print(error.localizedDescription)
                }

            } label: {
                Text("Play sound")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
        
        HStack(
            alignment: .top,
            spacing: 10
        ) {
            
            Button{
                //previous button action
                print("Previous pressed.")
                if(birdIndex >= 1){
                    birdIndex -= 1
                    print(birdIndex)
                    
                }
            } label: {
                Text("Previous")
                    .padding(20)
            }
            .contentShape(Rectangle())
            
            Button{
                //next button action
                print("Next pressed.")
                if(birdIndex < 4){
                    birdIndex += 1
                    print(birdIndex)
                }
            } label: {
                Text("Next")
                    .padding(20)
            }
            .contentShape(Rectangle())
        }
        
        if(birdIndex == 0){
            Image("flycatcher")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .trailing)
                .clipShape(Circle())
            
        }
        else if(birdIndex == 1){
            Image("crow")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
        }
        else if(birdIndex == 2){
            Image("great_tit")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
        }
        else if(birdIndex == 3){
            Image("magpie")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
        }
        else{
            Image("seagull")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
        }
        Text("Kuvan lintu: \(birds[birdIndex])")
            .padding(20)
            .frame(alignment: .center)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
