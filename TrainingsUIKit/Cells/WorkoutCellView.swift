//
//  WorkoutCellView.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct WorkoutCellView: View {
    @ObservedObject var workout: Workout
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(workout.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 16, weight: .bold))
                Text(workout.time ?? "0h 0m")
                    .foregroundStyle(.gray)
                    .font(.system(size: 16))
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
        }
        .padding()
        .background {
            Color.white.cornerRadius(10)
        }
    }
}

//#Preview {
//    WorkoutCellView()
//}
