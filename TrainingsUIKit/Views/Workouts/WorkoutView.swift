//
//  WorkoutView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct WorkoutView: View {
    @StateObject var vm: MainViewModel
    @ObservedObject var workout: Workout
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            VStack {
                //MARK: - Top tool bar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    if vm.isEditMod{
                        TextField(vm.simpleNameWorkout, text: $vm.simpleNameWorkout)
                    }else{
                        Text(workout.name ?? "")
                    }
                    
                    Spacer()
                    Button {
                        vm.editIsFavorite(workout: workout)
                    } label: {
                        Image(systemName: workout.isFavorite ? "minus" :"plus")
                            .foregroundStyle(.black)
                    }

                   
                }
                
                if let exercises = workout.exercise?.allObjects as? [Exercise]{
                    ScrollView {
                        ForEach(exercises) { exercise in
                            ExercisesCellView(exercises: exercise, vm: vm)
                        }
                    }
                    Spacer()
                    
                    
                    Button {
                        if vm.isEditMod{
                            vm.andEditMod(workout: workout)
                        }else{
                            vm.startEditMod(workout: workout)
                        }
                    } label: {
                        CustomButtonView(text: vm.isEditMod ? "Apply" : "Edit")
                    }


                }
                    
            }.padding()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    WorkoutView(vm: MainViewModel(), workout: Workout())
}
