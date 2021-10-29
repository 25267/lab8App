//
//  ContentView.swift
//  Lab8App
//
//  Created by Zhanibek on 28.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex:Int?
    @State var submitted = false
    
    @State var numCorrect = 0
    @State var showResults = false
    
    var body: some View {
        
        if model.currentQuestion != nil && showResults != true{
            
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.vertical)
            VStack{
                
                Text(model.currentQuestion!.title)
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                
                VStack {
                    ForEach(model.currentQuestion!.answers.indices, id: \.self) { questtionIndex in
                        
                        
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(height: 45)
                                
                                Text(model.currentQuestion!.answers[questtionIndex])
                                    .foregroundColor(.white)
                                    
                            }
                            .padding(.horizontal, 50)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                // Check if it's the last question
                                if model.currentQuestionIndex + 1 == model.questions.count {
                                    
                                   showResults = true
                                    
                                }
                                
                                else {
                                    
                                    model.next()
                                    
                                    
                                    submitted = false
                                    selectedAnswerIndex = nil
                                }
                            }
                        
                        
                        
                    }
                }
                
            }
            .padding()
                
            }
            
        }
        else {
            ZStack {
                Image("background")
                    .ignoresSafeArea()
                
                
                Text("Game is over!")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                    )
                    .onTapGesture {
                        model.currentContentSelected = nil
                    }
            }
            
        }
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
