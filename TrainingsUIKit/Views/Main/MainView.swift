//
//  MainView.swift
//  TrainingsUIKit
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = MainViewModel()
    
    var body: some View {
        TabView() {
            Workouts(vm: vm)
                .tabItem { VStack{
                    Image(systemName: "house.fill")
                    Text("Main")
                } }.tag(1)
            FavoriteView(vm: vm)
                .tabItem {  VStack{
                    Image(systemName: "rectangle.fill.badge.checkmark")
                    Text("Favorites")
                } }.tag(2)
            SettingsView()
                .tabItem {  VStack{
                    Image(systemName: "gearshape.circle.fill")
                    Text("Settings")
                } }.tag(3)
        }

    }
}

#Preview {
    MainView()
}
