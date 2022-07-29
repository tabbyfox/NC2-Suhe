//
//  SpeechRecognition1.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 28/07/22.
//

import Foundation
import Speech

public func requestTranscribePermissions() {
    SFSpeechRecognizer.requestAuthorization { authStatus in
        DispatchQueue.main.async {
            if authStatus == .authorized {
                print("Good to go!")
            } else {
                print("Transcription permission was declined.")
            }
        }
    }
}

public func transcribeAudio(url: URL) {
    // create a new recognizer and point it at our audio
    let recognizer = SFSpeechRecognizer()
    let request = SFSpeechURLRecognitionRequest(url: url)

    // start recognition!
    recognizer?.recognitionTask(with: request) { (result, error) in
        // abort if we didn't get any transcription back
        guard let result = result else {
            print("There was an error: \(error!)")
            return
        }

        // if we got the final transcription back, print it
        if result.isFinal {
            // pull out the best transcription...
            print(result.bestTranscription.formattedString)
        }
    }
}
