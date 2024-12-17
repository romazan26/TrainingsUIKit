//
//  SettingsView.swift
//  TrainingsUIKit
//
//  Created by Роман on 15.12.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.dismiss) var dismiss
    @State private var isPresenConfidicial = false
    @State private var isPresentPolicy = false
    @State var urlConfidicial = "https://www.apple.com/app-store/"
    @State var urlPrivacy = "https://www.apple.com/app-store/"
    @State var isPresentLanguage = false
    var body: some View {
        ZStack {
            Color(.grayApp).ignoresSafeArea()
            
            
            VStack(spacing: 15){
                            HStack{
                                Text("Settings")
                                    .foregroundStyle(.black)
                                    .font(.title2)
                                Spacer()
                            }
                            //MARK: - Privacy button
                            Button(action: {isPresentPolicy.toggle()}, label: {
                                SettingButton(text: "Privacy")
                            })
                            
                            //MARK: - Privacy button
                            Button(action: {isPresenConfidicial.toggle()}, label: {
                                SettingButton(text: "Confidentaility")
                            })
                            
                            
                            //MARK: - Rate App Button
                            Button {
                                SKStoreReviewController.requestReview()
                            } label: {
                                SettingButton(text: "Rate the aplication")
                            }
                            
                            Button {
                                openAppSettings()
                            } label: {
                                SettingButton(text: "Choose language")
                            }

                            
                            
                            Spacer()
                        }
                        .padding()
                    
                    .sheet(isPresented: $isPresenConfidicial, content: {
                        WebViewPage(urlString: URL(string: urlConfidicial)!)
                    })
                    .sheet(isPresented: $isPresentPolicy, content: {
                        WebViewPage(urlString: URL(string: urlPrivacy)!)
                    })
            
            //MARK: - Language
            Color.black.ignoresSafeArea().opacity(isPresentLanguage ? 0.5 : 0)
            
        }
        
    }
    private func openAppSettings() {
         guard let settingsURL = URL(string: UIApplication.openSettingsURLString),
               UIApplication.shared.canOpenURL(settingsURL) else { return }
         
         UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
     }
 
}

#Preview {
    SettingsView()
}

extension String {
    func localized(_ languageCode: String) -> String {
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return self // Возвращаем исходную строку, если перевода нет
        }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
