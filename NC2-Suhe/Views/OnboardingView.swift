//
//  OnboardingView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 28/07/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        TabView{
            PageView(imageName: "Home1", title: "Practice your english pronunciation!", subTitle: "This app will help you practice your english pronunciation in a simple and fun way.", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            PageView(imageName: "recording", title: "Record what you learn", subTitle: "Start recording what you learn, so you know your progress.", showDismissButton: false, shouldShowOnBoarding: $shouldShowOnBoarding)
            PageView(imageName: "Fun", title: "Keep practice and have fun", subTitle: "Don't forget to have fun!.", showDismissButton: true, shouldShowOnBoarding: $shouldShowOnBoarding)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView : View {
    let imageName: String
    let title: String
    let subTitle: String
    let showDismissButton: Bool
    @Binding var shouldShowOnBoarding: Bool
    
    var body: some View{
        VStack{
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height / 3.25)
//                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.height / 3)
            Spacer()
            Text(title)
                .font(Font.custom("Ding Dong", size: 32))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
//                .font(.system(size: 32))
            Text(subTitle)
                .font(.system(size: 21))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            if showDismissButton {
                Button(action: {
                    shouldShowOnBoarding.toggle()
                }, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .frame(width: 240, height: 50)
                        .foregroundColor(.white)
                        .background(Color.init(hex: "B1B0D0"))
                        .cornerRadius(20.0)
                })
                .padding(.bottom, (UIScreen.main.bounds.width / 9))

            } else {
                Text("Swipe >>")
                    .font(Font.custom("Ding Dong", size: 32))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.init(hex: "B1B0D0"))
                Spacer()

            }
        }
    }
}
