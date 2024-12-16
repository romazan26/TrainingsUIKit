//
//  CustomPregressbarView.swift
//  Trainings
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI

struct CustomProgressbarView: View {
    var progress = 0.0
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 100)
                .foregroundStyle(.gray)
            RoundedRectangle(cornerRadius: 100)
                .foregroundStyle(.yellowApp)
                .frame(width: CGFloat(progress) * 1.8, height: 5)
        }
        .frame(width: 180, height: 5)
        .animation(.bouncy, value: progress)
    }
}

#Preview {
    CustomProgressbarView()
}
