//
//  ExercisesCellView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct ExercisesCellView: View {
    @ObservedObject var exercises: Exercise
    @StateObject var vm: MainViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exercises.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 16, weight: .bold))
                Text(exercises.approaches ?? "")
                    .foregroundStyle(.gray)
                    .font(.system(size: 16))
            }
            Spacer()
            if vm.isEditMod{
                Button {
                    vm.deleteExercise(exercise: exercises)
                } label: {
                    Image(systemName: "minus")
                        .foregroundStyle(.black)
                }

            }
        }
        .padding()
        .background {
            Color.white.cornerRadius(10)
        }
        .onAppear {
            print(exercises)
        }
    }
}
