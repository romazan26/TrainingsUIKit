//
//  CustomButtonView.swift
//  TrainingsUIKit
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var color: UIColor = .yellowApp
    var text: LocalizedStringKey
    var body: some View {
        ZStack {
            Color(color)
                .cornerRadius(13)
            Text(text)
                .foregroundStyle(.black)
        }.frame(height: 51)
    }
}

//#Preview {
//    CustomButtonView()
//}
