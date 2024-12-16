//
//  AddExerciseView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct AddExerciseView: View {
    @Binding var approaches: String
    @Binding var name: String
    var body: some View {
        VStack {
            TextField("Exercise", text: $name)
                .padding()
                .background {
                    Color.white.cornerRadius(10)
                }
            TextField("Appraaches", text: $approaches)
                .padding()
                .background {
                    Color.white.cornerRadius(10)
                }
        }

    }
}

