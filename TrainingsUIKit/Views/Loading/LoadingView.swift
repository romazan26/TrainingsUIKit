//
//  ContentView.swift
//  Trainings
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var vm = LoadingViewModel()
    @StateObject private var languageManager = LanguageManager()
    var body: some View {
        VStack {
            Spacer()
            Image(.logo)
                .resizable()
                .frame(width: 90, height: 90)
            Text("Trainings")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.black)
            Text("training journal")
                .foregroundStyle(.gray)
                .font(.system(size: 13))
            Spacer()
            CustomProgressbarView(progress: vm.timeLoading)
        }
        .fullScreenCover(isPresented: $vm.isPresent, content: {
            MainView()
                .environmentObject(languageManager)
        })
        .padding()
        .onAppear {
            vm.starttimer()
        }
    }
}

#Preview {
    LoadingView()
}
