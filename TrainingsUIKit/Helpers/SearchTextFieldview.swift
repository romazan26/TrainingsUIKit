//
//  SearchTextFieldview.swift
//  TrainingsUIKit
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI

struct SearchTextFieldview: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            TextField("Find a workout", text: $searchText)
        }
        .padding(8)
        .background {
            Color.black.opacity(0.05).cornerRadius(11)
        }
    }
}

#Preview {
    SearchTextFieldview(searchText: .constant(""))
}
