//
//  ContentModel.swift
//  Lab8App
//
//  Created by Zhanibek on 28.10.2021.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var questions = [Question]()
    
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    @Published var currentContentSelected:Int?
    
    init() {
        
        getRemoteData()
        
    }
    
    func next() {
        
        
        currentQuestionIndex += 1
        
        
        if currentQuestionIndex > questions.count {
            
            currentQuestion = nil
            currentQuestionIndex = 0
        } else {
           
            currentQuestion = questions[currentQuestionIndex]
        }
        
     
        
    }
    
    
    func start() {
        
        
        currentQuestionIndex = 0
        
        if questions.count  > 0 {
            currentQuestion = questions[currentQuestionIndex]
            
           
        }
    }
    
    
    func getRemoteData() {
       
        let urlString = "https://25267.github.io/lab8jsondata/data.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            return
        }
        
        // Create a URLRequest object
        let request = URLRequest(url: url!)
        
        // Get the session and kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // Check if there's an error
            guard error == nil else {
                // There was an error
                return
            }
            
            do {
                // Create json decoder
                let decoder = JSONDecoder()
            
                // Decode
                let questions = try decoder.decode([Question].self, from: data!)
                
                DispatchQueue.main.async {
                    
                    // Append parsed modules into modules property
                    self.questions = questions
                    
                   
                }
               
                
            }
            catch {
                // Couldn't parse json
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
   
    
}
