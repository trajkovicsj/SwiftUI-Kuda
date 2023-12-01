//
//  SettingsView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct SettingsView: View {
    @State var settingsModel = SettingsViewModel()
    @State var toogleOn = true
    
    var body: some View {
        NavigationBar {
            VStack(spacing: 35) {
                HeaderView(title: settingsModel.title)
                List {
                    Section {
                        Group {
                            Toggle(isOn: $toogleOn) {
                                Text(settingsModel.subtitle)
                            }
                            DocumentsView(title: settingsModel.support)
                        }
                        .foregroundStyle(.white)
                        .listRowBackground(Color.pickerBackground)
                        .listRowSeparatorTint(.infoForeground)
                    }
                    Section {
                        Group {
                            DocumentsView(title: settingsModel.documents)
                            DocumentsView(title: settingsModel.termsAndCond)
                            DocumentsView(title: settingsModel.termsOfPrivate)
                            HStack {
                                Text(settingsModel.version)
                                Spacer()
                                Text(settingsModel.versionNumber)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .listRowBackground(Color.pickerBackground)
                    .listRowSeparatorTint(.infoForeground)
                }
                .listStyle(.plain)
                .listSectionSpacing(24)
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Odjavi se")
                            .foregroundStyle(.white)
                            .padding(.vertical, 12)
                            .frame(minWidth: 300)
                    })
                }
                .padding(.horizontal, 16)
                .border(.white)
                Spacer()
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.tabBarBackground, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .background(.primaryBackground)
        }
    }
}

#Preview {
    SettingsView()
}
