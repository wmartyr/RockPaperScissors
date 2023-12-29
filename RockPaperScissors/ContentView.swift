//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Woodrow Martyr on 28/12/2023.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "✋", "✌️"]

    @State private var appMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var resultTitle = ""
    @State private var showingResult = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Text("App chooses")
                Text(moves[appMove])
                    .font(.largeTitle)
                Text("You should \(shouldWin ? "win" : "not win")")
                Text("Your choice")
                HStack {
                    ForEach(0..<moves.count, id: \.self) {number in
                        Button(moves[number]) {
                            buttonTapped(number)
                        }
                        .font(.system(size: 75))
                    }
                }
            }
            .padding()
        }
        .alert(resultTitle, isPresented: $showingResult) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("")
        }
    }
    
    func playerWinCalculate(_ playerChoice: Int) -> Bool {
        let moveComparison = playerChoice - appMove
        return moveComparison == -2 || moveComparison == 1
    }
    
    func buttonTapped(_ playerChoice: Int) {
        if shouldWin == playerWinCalculate(playerChoice) {
            resultTitle = "Correct"
        } else {
            resultTitle = "Wrong"
        }
        showingResult = true
    }
    
    func askQuestion() {
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
