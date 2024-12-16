//
//  LoadingViewModel.swift
//  Trainings
//
//  Created by Роман on 15.12.2024.
//
import SwiftUI

final class LoadingViewModel: ObservableObject {
    
    @Published var timeLoading: Double = 0
    @Published var isPresent: Bool = false
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool?
    
    func starttimer(){
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            if self.timeLoading < 100{
                self.timeLoading += 1
            }else {
                timer.invalidate()
                self.isPresent = true
            }
        }
    }
}


class LanguageManager: ObservableObject {
    @Published var selectedLanguage: String = "en" // По умолчанию — английский
    
    func setLanguage(_ language: String) {
        selectedLanguage = language
        UserDefaults.standard.set([language], forKey: "AppleLanguages") // Сохраняем выбранный язык
        UserDefaults.standard.synchronize() // Применяем изменения
    }
}
