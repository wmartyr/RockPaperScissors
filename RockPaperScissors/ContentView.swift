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
    @State private var playerMove = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("App chooses \(moves[appMove])")
            Text("You should \(shouldWin ? "win" : "lose")")
            Text("Your choice")
            HStack {
                ForEach(0..<moves.count, id: \.self) {
                    Button(moves[$0]) {
                        print("Button pressed")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
