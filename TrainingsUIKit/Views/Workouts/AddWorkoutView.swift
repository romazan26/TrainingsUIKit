//
//  AddWorkoutView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct AddWorkoutView: View {
    @StateObject var vm: MainViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            VStack(spacing: 10) {
                //MARK: - Top tool bar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    TextField("Name training", text: $vm.simpleNameWorkout)
                    Spacer()
                    Image(systemName: "pencil")
                        .foregroundStyle(.black)
                }
                
                ScrollView {
                    //MARK: - Time workout
                    TextField("0h 0min", text: $vm.simpleTimeWorkout)
                        .padding()
                        .background {
                            Color.white.cornerRadius(10)
                        }
                    ForEach(vm.simpleExercises) { exercise in
                        NewExerciseCellView(exercise: exercise, vm: vm)
                            .padding(.top)
                    }
                    
                    //New exercise
                    AddExerciseView(approaches: $vm.simpleApproaches, name: $vm.simpleNameExercise)
                    
                    //MARK: - One more exercise
                    Button {
                        vm.addSimpleExercise()
                        vm.simpleNameExercise = ""
                        vm.simpleApproaches = ""
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2.0)
                            Image(systemName: "plus")
                                .foregroundStyle(.gray)
                        }.frame(height: 72)
                    }

                    
                }
                //MARK: - Add workout button
                HStack {
                    Spacer()
                    Button {
                        vm.addWorkout()
                        dismiss()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .foregroundStyle(.yellowApp)
                    }
                    .padding()
                }

            }.padding()
                .navigationBarBackButtonHidden(true)
        }
    
    }
}

#Preview {
    AddWorkoutView(vm: MainViewModel())
}
