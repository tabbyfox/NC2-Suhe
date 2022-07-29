//
//  SpeechRecognition.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 28/07/22.
//

import Foundation
import Speech

func requestPermission(completion: @escaping (String) -> Void){
    SFSpeechRecognizer.requestAuthorization { authStatus in
        if authStatus == .authorized{
            if let path = Bundle.main.path(forResource: "music", ofType: "mp3"){
                recognizeAudio(url: URL(fileURLWithPath: path), completion: completion)
            }
        }else{
            print("Speech Failed")
        }
    }
}

func recognizeAudio(url: URL, completion: @escaping (String) -> Void){
    let recognizer = SFSpeechRecognizer()
    let request = SFSpeechURLRecognitionRequest(url: url)
    recognizer?.recognitionTask(with: request, resultHandler: {
        result, error in
        guard let result = result else {
            print("Error occured")
            return
        }
        completion(result.bestTranscription.formattedString)
    })
}
