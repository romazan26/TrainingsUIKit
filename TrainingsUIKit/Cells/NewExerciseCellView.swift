//
//  NewExerciseCellView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct NewExerciseCellView: View {
    var exercise: Exercise
    @StateObject var vm: MainViewModel
    var body: some View {
        VStack {
            HStack {
                let exerciseName = exercise.name ?? ""
                Text(exerciseName)
                    
                    
                Spacer()
                Button(action: {
                    vm.removeSimpleExercise(byName: exerciseName)
                }) {
                    Image(systemName: "minus")
                        .foregroundStyle(.black)
                }
            }
            .padding()
            .background(Color.white.cornerRadius(10))
            
            HStack{
                let exerciseApproaches = exercise.approaches ?? ""
                Text(exerciseApproaches)

                Spacer()
            }
            .padding()
            .background(Color.white.cornerRadius(10))
        }
    }
}


