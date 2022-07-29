//
//  RecordView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import SwiftUI

struct RecordView: View {
    
    @ObservedObject var vm = VoiceViewModel.shared
    
    @State private var showingList = false
    @State private var showingAlert = false
    
    @State private var effect1 = false
    @State private var effect2 = false
    
    @State var lyrics = ""
    
    let title: String
    let story: String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "ACCAF0"))
            
            VStack(alignment: .center, spacing: 10) {
                
                ScrollView {
                    Text("\(story)")
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.95,
                               alignment: .topLeading)
                }
                .frame(width: UIScreen.main.bounds.width * 0.95,
                       height: UIScreen.main.bounds.height * 0.28, alignment: .center)
                .background(.white)
                .opacity(0.6)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                ScrollView {
                    Text(lyrics)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.95,
                               alignment: .topLeading)
                }
                .frame(width: UIScreen.main.bounds.width * 0.95,
                       height: UIScreen.main.bounds.height * 0.28, alignment: .center)
                .background(.white)
                .opacity(0.6)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
//                Rectangle()
//                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.width / 4.2, alignment: .center)
//                    .ignoresSafeArea()
//    //                .position(x: UIScreen.main.bounds.midX, y: 0)
//                    .foregroundColor(.cyan)
                
                if vm.isRecording {
                    
                    VStack(alignment : .leading , spacing : -5){
                        HStack (spacing : 3) {
                            Image(systemName: vm.isRecording && vm.toggleColor ? "circle.fill" : "circle")
                                .font(.system(size:10))
                                .foregroundColor(.red)
                            Text("Rec")
                        }
                        Text(vm.timer)
                            .font(.system(size:60))
                            .foregroundColor(.white)
                    }
                    
                } else {
                    
                    VStack{
                        Text("Press the Recording Button below")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("and Stop when its done")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(width: 300, height: 100, alignment: .center)
                    
                }
                
                ZStack {
                    
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(#colorLiteral(red: 0.4157493109,
                                                             green: 0.8572631,
                                                             blue: 0.9686274529,
                                                             alpha: 0.4940355314)))
                        .scaleEffect(effect2 ? 1 : 0.8)
                        .animation(
                            Animation.easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true)
                            .speed(1), value: effect2)
                        .onAppear(){
                            self.effect2.toggle()
                        }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.2392156869,
                                                             green: 0.6745098233,
                                                             blue: 0.9686274529,
                                                             alpha: 1)))
                        .scaleEffect(effect2 ? 1 : 1.5)
                        .animation(
                            Animation.easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true)
                            .speed(2), value: effect2)
                        .onAppear(){
                            self.effect1.toggle()
                        }
                    
                    
                    Image(systemName: vm.isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 45))
                        .onTapGesture {
                            if vm.isRecording == true {
                                vm.stopRecording()
                            } else {
                                vm.startRecording()
                                 
                            }
                        }

                }
                
            }
            .navigationTitle("\(title)")
            .navigationBarTitleDisplayMode(.large)
            .onAppear{
//                requestTranscribePermissions()
            }
//            .frame(width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
//        .background(Color.init(hex: "ACCAF0"))
        }
    }
}

//struct RecordView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordView()
//    }
//}
