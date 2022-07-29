//
//  RecordingsView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import Foundation

import SwiftUI

struct RecordingsView: View {
    
    @ObservedObject var storyModel = StoryViewModel.shared
    @ObservedObject var vm = VoiceViewModel.shared
  
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "ACCAF0"))
            
            VStack {
                
                Text("Stories")
                    .font(Font.system(size: 22, weight: .bold, design: .default))
                
                ScrollView {
                    ForEach(storyModel.stories) { story in
                        NavigationLink(destination: RecordView(title: story.name, story: story.story)) {
                            VStack(alignment: .center) {
                                HStack(alignment: .center, spacing: 5) {
                                    
                                    Image(systemName:"mic.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(Color.black)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("\(story.name)")
                                            .font(.headline)
                                            .frame(width: UIScreen.main.bounds.width * 0.65,
                                                   height: UIScreen.main.bounds.width * 0.04,
                                                   alignment: .leading)
                                            .foregroundColor(Color.black)

                                        Text("\(story.description)")
                                            .font(.footnote)
                                            .frame(width: UIScreen.main.bounds.width * 0.65,
                                                   height: UIScreen.main.bounds.width * 0.04,
                                                   alignment: .leading)
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.65,
                                           height: UIScreen.main.bounds.width * 0.15)
                                
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.85,
                                   height: UIScreen.main.bounds.width * 0.2)
                            .background(.cyan)
                            .cornerRadius(20)
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height * 0.3)
                .background(Color.init(hex: "ACCAF0"))
//                .border(.black, width: 2)
                
                Text("Recordings")
                    .font(Font.system(size: 22, weight: .bold, design: .default))

                
                ScrollView(showsIndicators: false){
                    ForEach(vm.recordingsList, id: \.createdAt) { recording in
                        VStack(alignment: .center){
                            HStack(alignment: .center, spacing: 5){
                                Image(systemName:"headphones.circle.fill")
                                    .font(.system(size:50))
                                
                                VStack(alignment: .center) {
                                    Text("\(recording.fileURL.lastPathComponent)")
                                        .frame(width: UIScreen.main.bounds.width * 0.57,
                                               height: UIScreen.main.bounds.width * 0.15,
                                               alignment: .leading)
                                }
                                VStack {
                                    Button(action: {
                                        vm.deleteRecording(url:recording.fileURL)
                                    }) {
                                        Image(systemName:"xmark.circle.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15))
                                    }
                                    Spacer()
                                    
                                    Button(action: {
                                        if recording.isPlaying == true {
                                            vm.stopPlaying(url: recording.fileURL)
                                        }else{
                                            vm.startPlaying(url: recording.fileURL)
                                        }
                                    }) {
                                        Image(systemName: recording.isPlaying ? "stop.fill" : "play.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size:30))
                                    }
                                    
                                }
                                .frame(height: UIScreen.main.bounds.width * 0.15)
                            }
                        }
                        .padding(.horizontal, 10)
                        .frame(width: UIScreen.main.bounds.width * 0.85,
                               height: UIScreen.main.bounds.width * 0.2)
                        .background(.cyan)
                        .cornerRadius(20)
                    }
                }
                .frame(width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height * 0.3)
                .background(Color.init(hex: "ACCAF0"))
                
            }
            
        }
        .navigationBarTitle("Recordings")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct RecordingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsView()
    }
}
