//
//  StoryListCell.swift
//  NC2-Suhe
//
//  Created by Suherda Dwi Santoso on 27/07/22.
//

import SwiftUI

struct AddButton: View {

    // MARK: - Properties
    @Binding var editMode: EditMode
    @Binding var alertShowing: Bool

    // MARK: - UI Elements
    var body: some View {
        if editMode == .inactive {
            return AnyView(Button(action: {
                    withAnimation {
                        if alertShowing {
                            alertShowing = false
                        } else {
                            alertShowing = true
                        }
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 25))

                })
        } else {
            return AnyView(EmptyView())
        }
    }
}
