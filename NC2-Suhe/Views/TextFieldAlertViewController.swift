//
//  TextFieldAlert.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import SwiftUI
import Combine

class TextFieldAlertViewController: UIViewController {

    // MARK: - Properties
    private let alertTitle: String
    private let message: String?
    private var isPresented: Binding<Bool>?

    private var subscription: AnyCancellable?
    
    // MARK: - Life Cycle
    init(title: String, message: String?, isPresented: Binding<Bool>?) {
        self.alertTitle = title
        self.message = message
        self.isPresented = isPresented
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentAlertController()
    }

    // MARK: - Methods
    private func presentAlertController() {
        guard subscription == nil else { return }
        let ac = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        
        ac.view.tintColor = .red
        
        ac.addTextField()
        ac.addTextField()
        ac.addTextField()
        ac.textFields![0].placeholder = "Title"
        ac.textFields![1].placeholder = "Description"
        ac.textFields![2].placeholder = "Story"

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
            self?.isPresented?.wrappedValue = false
        }
        let createAction = UIAlertAction(title: "Create", style: .default) { [unowned ac] _ in
            let title = ac.textFields![0].text!
            let description = ac.textFields![1].text!
            let story = ac.textFields![2].text!
            let stories = Stories(name: title, description: description, story: story)
            
            StoryViewModel.shared.create(story: stories)
        }
        
        ac.addAction(cancelAction)
        ac.addAction(createAction)
        present(ac, animated: true, completion: nil)
    }
}
