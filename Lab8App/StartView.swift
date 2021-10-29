//
//  StartView.swift
//  Lab8App
//
//  Created by Zhanibek on 28.10.2021.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Destini")
                    .font(.largeTitle)
                
                NavigationLink(
                    tag: 0,
                    selection: $model.currentContentSelected) {
                        ContentView()
                            .onAppear {
                                model.start()
                            }
                    } label: {
                        Text("Play")
                    }
                
                
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
