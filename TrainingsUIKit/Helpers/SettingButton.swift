//
//  SettingButton.swift
//  TrainingsUIKit
//
//  Created by Роман on 16.12.2024.
//

import SwiftUI

struct SettingButton: View {
    var text: LocalizedStringResource
    var body: some View {
        HStack{
            Text(text)
                
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 6, height: 11)
        }
        .foregroundStyle(.black)
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .frame(height: 53)
        
    }
}

//#Preview {
//    SettingButton()
//}
