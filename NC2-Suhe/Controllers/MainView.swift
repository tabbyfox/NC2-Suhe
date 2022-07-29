//
//  ContentView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 25/07/22.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    @State var shouldShowOnboarding: Bool = true
    @State private var name : String = ""

    var body: some View {
        NavigationView {
        VStack(alignment: .center, spacing: 15) {
                ZStack(alignment: .center) {
                    Text("Home")
                        .font(.system(size: 26, weight: .heavy,
                                      design: .default))
                        .position(x: UIScreen.main.bounds.midX,
                                  y: UIScreen.main.bounds.height / 12)
                }
                .frame(width: UIScreen.main.bounds.width ,
                       height: UIScreen.main.bounds.width / 4, alignment: .center)
                .background(Color.init(hex: "B1B0D0"))
                .ignoresSafeArea()
                .padding(0)
                
                Image("Home1")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width ,
                           height: UIScreen.main.bounds.height / 3.25 , alignment: .top)
                    .padding(.top, -(UIScreen.main.bounds.width / 12))
//                    .position(x: UIScreen.main.bounds.width / 2, y: 70)
                
                Text("Pronunciation Test")
                .frame(width: UIScreen.main.bounds.width / 1.2,
                       height: UIScreen.main.bounds.width * 0.06, alignment: .leading)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .padding(.top, -(UIScreen.main.bounds.width / 18))
                
                HStack(alignment: .center, spacing: 15) {
                    TextField("Type a word", text: $name)
                        .frame(width: UIScreen.main.bounds.width * 0.6,
                               height: UIScreen.main.bounds.width / 9)
                        .padding(.horizontal, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        
                    Button(action: {
                        let utterance = AVSpeechUtterance(string: "\(name)")
                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                        utterance.rate = 0.42
                        
                
                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
                        
                        }, label: {
                            
                            Image("Voice")
                                .resizable()
                            
                        })
                        .buttonStyle(.plain)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color.init(hex: "D8D8D8"))
                        .clipShape(Circle())

                }
                        
                HStack(alignment: .center, spacing: 60) {
                    NavigationLink(destination:  ListeningView()) {
                            VStack(alignment: .center, spacing: 10) {
                                Image("Listening")
                                    .frame(width: UIScreen.main.bounds.width / 2.9, height: UIScreen.main.bounds.width / 2.9, alignment: .center)
                                    .background(Color.init(hex: "FFD992"))
                                    .cornerRadius(20)
                                
                                Text("Listening")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(.black)
                        }
                    }
                    
                    NavigationLink(destination: RecordingsView()) {
                        VStack(alignment: .center, spacing: 10) {
                            Image("Record")
                                .frame(width: UIScreen.main.bounds.width / 2.9, height: UIScreen.main.bounds.width / 2.9, alignment: .center)
                                .background(Color.init(hex: "ACCAF0"))
                                .cornerRadius(20)
                            
                            Text("Practice")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .padding(.top, 10)
                
                HStack(alignment: .center, spacing: 60) {
                    NavigationLink(destination: Objects3DView()) {
                        VStack(alignment: .center, spacing: 10) {
                            Image("AR")
                                .frame(width: UIScreen.main.bounds.width / 2.9, height: UIScreen.main.bounds.width / 2.9, alignment: .center)
                                .background(Color.init(hex: "E189B0"))
                                .cornerRadius(20)

                            Text("3D Objects")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .foregroundColor(.black)
                        }
                    }
                    NavigationLink(destination: SettingsView()) {
                        VStack(alignment: .center, spacing: 10) {
                            Image("Settings")
                                .frame(width: UIScreen.main.bounds.width / 2.9, height: UIScreen.main.bounds.width / 2.9, alignment: .center)
                                .background(Color.init(hex: "CD6667"))
                                .cornerRadius(20)

                            Text("Settings")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                Spacer()
                
            }
            .navigationBarHidden(true)
//            .navigationTitle("Home")
//            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
                OnboardingView(shouldShowOnBoarding: $shouldShowOnboarding)
            })
        }
//        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
