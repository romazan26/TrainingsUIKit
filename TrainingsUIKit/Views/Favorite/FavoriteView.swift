//
//  FavoriteView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var vm: MainViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                Color.grayApp.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    //MARK: - Search view
                    SearchTextFieldview(searchText: $vm.searchText)
                    
                    //MARK: - Title
                    Text("Favorite workouts")
                        .foregroundStyle(.black)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.top, 30)
                    
                    //MARK: - List workout
                    ScrollView {
                        ForEach(vm.favoriteWorkouts.filter({vm.isSearching(work: $0)})) { workout in
                            NavigationLink {
                                WorkoutView(vm: vm, workout: workout)
                            } label: {
                                WorkoutCellView(workout: workout)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    //MARK: - Add button
                    NavigationLink {
                        AddWorkoutView(vm: vm)
                    } label: {
                        CustomButtonView(text: "New workout")
                    }


                }
                .padding()
            }
        }
    }
}

#Preview {
    FavoriteView(vm: MainViewModel())
}
