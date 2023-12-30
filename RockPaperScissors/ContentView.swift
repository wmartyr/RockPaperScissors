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
    @State private var showingFinalScore = false
    @State private var questionNumber = 0
    @State private var score = 0
    
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
            Text("Your score is \(score)")
        }
        .alert(resultTitle, isPresented: $showingFinalScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Game over. Your final score is \(score) out of 10")
        }
    }
    
    func playerWinCalculate(_ playerChoice: Int) -> Bool {
        let moveComparison = playerChoice - appMove
        return moveComparison == -2 || moveComparison == 1
    }
    
    func buttonTapped(_ playerChoice: Int) {
        if shouldWin == playerWinCalculate(playerChoice) {
            resultTitle = "Correct"
            score += 1
        } else {
            resultTitle = "Wrong"
        }
        questionNumber += 1
        if questionNumber < 10 {
            showingResult = true
        } else {
            showingFinalScore = true
        }
            
    }
    
    func askQuestion() {
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    func restartGame() {
        questionNumber = 0
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
