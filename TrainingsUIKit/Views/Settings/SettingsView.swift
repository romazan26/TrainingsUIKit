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
                                isPresentLanguage.toggle()
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
            if isPresentLanguage {
                
                VStack(spacing: 20) {
                    Text("Restart the application".localized(languageManager.selectedLanguage))
                        .minimumScaleFactor(0.5)
                        .font(.title)
                    Button(action: {
                        languageManager.setLanguage("en") // Переключение на английский
                    }) {
                        HStack{
                            Text("English")
                            Spacer()
                            if languageManager.selectedLanguage == "en" {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.yellowApp)
                                
                            }else{
                                Circle().foregroundStyle(.grayApp)
                                    .frame(width: 28)
                            }
                        }.frame(minHeight: 30)
                    }
                    
                    Button(action: {
                        languageManager.setLanguage("ru") // Переключение на русский
                    }) {
                        HStack{
                            Text("Русский")
                            Spacer()
                            if languageManager.selectedLanguage == "ru" {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.yellowApp)
                                
                            }else{
                                Circle().foregroundStyle(.grayApp)
                                    .frame(width: 28)
                            }
                        }.frame(minHeight: 30)
                    }
                    
                    HStack{
                        Button {
                            isPresentLanguage.toggle()
                        } label: {
                            CustomButtonView(color: .grayApp, text: "Cancel")
                        }
                        Button {
                            isPresentLanguage.toggle()
                        } label: {
                            CustomButtonView( text: "Continue")
                        }
                        
                    }
                }
                .padding(8)
                .background(content: {
                    Color.white.cornerRadius(20)
                })
                .frame(width: 310, height: 192)
            }
            
        }
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
