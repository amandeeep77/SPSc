//
//  ContentView.swift
//  SPSc
//
//  Created by Amandeep Singh on 16/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var cpuChoice = 0
    @State var playerChoice = 0
    @State var playerImg = "rock"
    @State var cpuImg = "rock"
    @State var Winner = 0
    @State var resu = ""
    @State var showAler = false
    var body: some View {
        ZStack{
            Image("yellow")
            VStack{
                Spacer()
                Image("logo")
                Spacer()
            HStack{Spacer()
                
                VStack{
                Text("Player Score")
                    Text(String(playerScore))
                    Text("PLAYER")
                        .padding(.top, 20.0)
            }
                
                
                VStack{
                Text("CPU Score")
                    Text(String(cpuScore))
                    Text("CPU")
                        .padding(.top, 20.0)
            }
                
                Spacer()
        }
                
                HStack{
                    
                Image(playerImg).resizable().frame(width: 200, height: 200)
                    Image(cpuImg).resizable().frame(width: 200, height: 200)
                    
                    
                }
                Spacer()
                HStack{
                    Button(action: {
                        playerImg = "rock"
                        playerChoice = 1
                        cpuChoice = Int.random(in: 1...3)
                        if cpuChoice == 2
                        { cpuScore += 1
                            cpuImg = "paper"
                        }
                        else if cpuChoice == 3
                        { playerScore += 1
                            cpuImg = "scissor"
                        }
                        else
                        {cpuImg = "rock"}
                        if playerScore == 5 || cpuScore == 5
                    {
                            if playerScore == 5
                            {
                                resu = "PLAYER WINS"
                                showAler = true
                            }
                            else
                            {
                                resu = "CPU WINS"
                                showAler = true
                            }
                        }
                        
                        }) {
                        Image("rock").resizable().frame(width: 80, height: 80)}
                        
                        
                        Button(action: {
                            playerImg = "paper"
                            playerChoice = 2
                            cpuChoice = Int.random(in: 1...3)
                            if cpuChoice == 1
                            { playerScore += 1
                                cpuImg = "rock"
                            }
                            else if cpuChoice == 3
                            { cpuScore += 1
                                cpuImg = "scissor"
                            }
                            else
                            {cpuImg = "paper"}
                            if playerScore == 5 || cpuScore == 5
                        {
                                if playerScore == 5
                                {
                                    resu = "PLAYER WINS"
                                    showAler = true
                                }
                                else
                                {
                                    resu = "CPU WINS"
                                    showAler = true
                                }
                            }
                        }) {
                            Image("paper").resizable().frame(width: 80, height: 80)}
                            Button(action: {
                                playerImg = "scissor"
                                cpuChoice = Int.random(in: 1...3)
                                if cpuChoice == 1
                                { cpuScore += 1
                                    cpuImg = "rock"
                                }
                                else if cpuChoice == 2
                                { playerScore += 1
                                    cpuImg = "paper"
                                }
                                else
                                {cpuImg = "scissor"}
                                if playerScore == 5 || cpuScore == 5
                            {
                                    if playerScore == 5
                                    {
                                        resu = "PLAYER WINS"
                                        showAler = true
                                    }
                                    else
                                    {
                                        resu = "CPU WINS"
                                        showAler = true
                                    }
                                }
                            }) {
                                Image("scissor").resizable().frame(width: 80, height: 80)
                    }
                
                }
                .alert(isPresented: $showAler){
                    Alert(title: Text(resu), message: Text("Restart or Quit"), primaryButton: .default(Text("RESET"), action: {playerScore = 0
                        cpuScore = 0
                        showAler = false}), secondaryButton: .default(Text("QUIT"), action: {playerScore = 0
                            cpuScore = 0
                            showAler = false}))
                }
                Spacer()
                
            
              
                
}
            
        }
}

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

