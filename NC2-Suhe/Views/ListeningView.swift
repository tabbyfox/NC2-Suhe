//
//  ListeningView.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 26/07/22.
//

import SwiftUI

struct ListeningView: View {
    
    @ObservedObject var vm = VoiceViewModel()
    @State private var editMode: EditMode = .inactive
    @ObservedObject var storyModel = StoryViewModel.shared
    @State private var alertShowing = false
    @State var showView = false


    var body: some View {
        
        ZStack {
            
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.init(hex: "FFD992"))
            
            VStack {
                
                HStack {
                    
                    Image("Story")
                        .frame(width: UIScreen.main.bounds.width * 0.2,
                               height: UIScreen.main.bounds.width * 0.2,
                               alignment: .center)
                    
                    Text("Story")
                        .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.black)
                }
                .padding(0)

                ScrollView {
                    ForEach(storyModel.stories) { story in
                        NavigationLink(destination: ListenVoiceView(title: story.name, story: story.story)) {
                            VStack(alignment: .center) {
                                HStack(alignment: .center, spacing: 20) {
                                    
                                    Image(systemName:"headphones.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(Color.black)
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("\(story.name)")
                                            .font(.headline)
                                            .frame(width: UIScreen.main.bounds.width * 0.45,
                                                   height: UIScreen.main.bounds.width * 0.04,
                                                   alignment: .leading)
                                            .foregroundColor(Color.black)

                                        Text("\(story.description)")
                                            .font(.footnote)
                                            .frame(width: UIScreen.main.bounds.width * 0.45,
                                                   height: UIScreen.main.bounds.width * 0.04,
                                                   alignment: .leading)
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.45,
                                           height: UIScreen.main.bounds.width * 0.15)
                                    
                                    VStack {
                                        
                                        Button(action: {
        //                                    vm.deleteRecording(url:recording.fileURL)
                                        }) {
                                            Image(systemName:"xmark.circle.fill")
                                                .foregroundColor(.black)
                                                .font(.system(size:30))
                                        }
                                        
                                    }
                                
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.85,
                                   height: UIScreen.main.bounds.width * 0.2)
                            .background(.orange)
                        .cornerRadius(20)
                        }
                    }
                    .onDelete(perform: storyModel.delete)
                    .onMove(perform: storyModel.move)
                    .onTapGesture {
                        
                    }
                }
                .padding(0)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height * 0.65)
                .background(Color.init(hex: "FFD992"))
//                .border(.black, width: 2)
            }
            .navigationTitle(Text("Listening"))
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
//                leading: EditButton(),
                trailing: AddButton(editMode: $editMode,
                                    alertShowing: $alertShowing)
            )
            .textFieldAlert(isPresented: $alertShowing) {
                TextFieldAlert(title: "Write a story!", message: nil)
            }
            .environment(\.editMode, $editMode)
            
        }
        
    }
    
}

struct ListeningView_Previews: PreviewProvider {
    static var previews: some View {
        ListeningView()
    }
}
