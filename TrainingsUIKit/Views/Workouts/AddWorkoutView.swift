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
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
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
                        .focused($isFocused)
                    Spacer()
                    Image(systemName: "pencil")
                        .foregroundStyle(.black)
                }
                
                ScrollView {
                    //MARK: - Time workout
                    HStack {
                        Text("Time workout")
                        Spacer()
                        DatePicker(
                            "",
                            selection: $vm.simpletime,
                            displayedComponents: [.hourAndMinute]
                        )
                        .labelsHidden() // Скрыть метки
                        
                    }
                    .padding()
                    .background {
                        Color.white.cornerRadius(10)
                    }
                    
                    //MARK: - exercises list
                    ForEach(vm.simpleExercises) { exercise in
                        NewExerciseCellView(exercise: exercise, vm: vm)
                            .focused($isFocused)
                            .padding(.top, 20)
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
            }
            .onTapGesture {
                isFocused = false
            }
            .padding()
                .navigationBarBackButtonHidden(true)
            //MARK: - Add workout button
            
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
        .onTapGesture {
            isFocused = false
        }
    
    }
}

#Preview {
    AddWorkoutView(vm: MainViewModel())
}
