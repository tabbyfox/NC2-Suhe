//
//  ListenVoiceView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 28/07/22.
//

import SwiftUI
import AVFoundation

struct ListenVoiceView: View {
    
    let title: String
    let story: String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "FFD992"))
            
            VStack(alignment: .center, spacing: 10) {
    
                ScrollView {
                    Text("\(story)")
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.95, alignment: .topLeading)
                }
                .frame(width: UIScreen.main.bounds.width * 0.95,
                       height: UIScreen.main.bounds.height * 0.65, alignment: .center)
                .background(.white)
                .opacity(0.6)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                
                
                Button(action: {
                    let utterance = AVSpeechUtterance(string: "\(story)")
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    utterance.rate = 0.42
                    
            
                    let synthesizer = AVSpeechSynthesizer()
                    synthesizer.speak(utterance)
                    
                    }, label: {
                        
                        Image("Voice")
                            .resizable()
                        
                    })
                    .buttonStyle(.plain)
                    .frame(width: 65, height: 65, alignment: .center)
                    .background(Color.init(hex: "ACCAF0"))
                    .clipShape(Circle())
                    .padding()
                
                
            }
            .navigationTitle("\(title)")
            .navigationBarTitleDisplayMode(.large)
            .accentColor(.white)
        }
    }
}

//struct ListenVoiceView_Previews: PreviewProvider {
//    static var previews: some View {
////        ListenVoiceView(title: <#T##String#>, story: <#T##String#>)
//    }
//}
