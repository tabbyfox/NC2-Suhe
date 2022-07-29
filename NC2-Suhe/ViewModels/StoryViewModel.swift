//
//  StoryViewModel.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import Foundation

class StoryViewModel : ObservableObject {
    
    static let shared = StoryViewModel()
    private let dataSourceURL: URL
    @Published var stories = [Stories]()
    
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let storyPath = documentsPath.appendingPathComponent("stories").appendingPathExtension("json")
        dataSourceURL = storyPath
        
        _stories = Published(wrappedValue: getStories())
    }
    
    private func getStories() -> [Stories] {
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: dataSourceURL)
            let decodedNotes = try! decoder.decode([Stories].self, from: data)
            
            return decodedNotes
        } catch {
            return []
        }
    }
    
    private func saveStory() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stories)
            try data.write(to: dataSourceURL)
        } catch {

        }
    }
    
    func create(story: Stories) {
        stories.insert(story, at: 0)
        saveStory()
    }
    
    func changeStory(story: Stories, index: Int) {
        stories[index] = story
        saveStory()
    }
    
    func delete(_ offsets: IndexSet) {
        stories.remove(atOffsets: offsets)
        saveStory()
    }
    
    func move(source: IndexSet, destination: Int) {
        stories.move(fromOffsets: source, toOffset: destination)
        saveStory()
    }
    
}
