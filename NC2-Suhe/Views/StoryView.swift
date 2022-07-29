//
//  StoryView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "FFD992"))
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: UIScreen.main.bounds.width * 0.95,
                       height: UIScreen.main.bounds.height * 0.75,
                       alignment: .center)
                .foregroundColor(.white)
                .opacity(0.8)
                .border(.black, width: 2)
            
            
            VStack(alignment: .center, spacing: 10) {
    
                Text("Hello, World!")
                    .padding(0)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .accentColor(.white)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
