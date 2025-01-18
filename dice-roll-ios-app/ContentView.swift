//
//  ContentView.swift
//  dice-roll-ios-app
//
//  Created by Haris Alicic on 14. 1. 2025..
//

import SwiftUI

struct ContentView: View {
    @State private var leftDice: String = "DiceOne"
    @State private var rightDice: String = "DiceTwo"
    
    let dices: [String] = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    
    func rollDice() {
        let randomLeftDice: Int = Int.random(in: 0...5)
        let randomRightDice: Int = Int.random(in: 0...5)
        
        leftDice = dices[randomLeftDice]
        rightDice = dices[randomRightDice]
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Image("DiceeLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 250, maxHeight: 250)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            VStack {
                HStack() {
                    Spacer()
                    DiceView(diceImage: leftDice)
                    Spacer()
                    DiceView(diceImage: rightDice)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            
            VStack {
                Button(action: rollDice) {
                    Text("ROLL")
                        .padding(.vertical, 15)
                        .padding(.horizontal, 40)
                        .bold()
                        .foregroundStyle(Color.white)
                }.background(Color(red: 0.609, green: 0.111, blue: 0.119))

                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("GreenBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    ContentView()
}

struct DiceView: View {
    var diceImage: String
    
    var body: some View {
        Image(diceImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 100, maxHeight: 100)
    }
}
