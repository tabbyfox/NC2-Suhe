//
//  AddStoryView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import SwiftUI

struct AddStoryView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "FFD992"))
            
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

struct AddStoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryView()
    }
}
