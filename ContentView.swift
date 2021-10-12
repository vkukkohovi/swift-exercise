//
//  ContentView.swift
//  Shared
//
//  Created by user206250 on 10/11/21.
//

import SwiftUI

/*
let flycatcher = UIImage(named: "flycatcher")
let crow = UIImage(named: "crow")
let great_tit = UIImage(named: "great_tit")
let magpie = UIImage(named: "magpie")
let seagull = UIImage(named: "seagull")
var images: [UIImage] = [named: flycatcher]
*/

let birds = ["Flycatcher", "Crow",
            "Great Tit", "Magpie",
            "Seagull"]


struct ContentView: View {
    @State var birdIndex = 0;
    var body: some View {

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
        Text("Current bird: \(birds[birdIndex])")
            .padding(20)
            .frame(alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
