//
//  Lab8AppApp.swift
//  Lab8App
//
//  Created by Zhanibek on 28.10.2021.
//

import SwiftUI

@main
struct Lab8AppApp: App {
    @EnvironmentObject var model: ContentModel
    var body: some Scene {
        WindowGroup {
            StartView()
               
                .environmentObject(ContentModel())
        }
    }
}
