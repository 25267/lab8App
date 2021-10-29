//
//  Question.swift
//  Lab8App
//
//  Created by Zhanibek on 28.10.2021.
//

import Foundation


struct Question: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var answers: [String]
}

