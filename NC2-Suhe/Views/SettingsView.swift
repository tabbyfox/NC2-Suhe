//
//  EtcView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "CD6667"))
            
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

struct EtcView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
