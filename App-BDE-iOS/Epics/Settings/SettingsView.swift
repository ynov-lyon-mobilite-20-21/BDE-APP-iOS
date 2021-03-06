//
//  SettingsView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 20/02/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("")) {
                        NavigationLink(destination: ViewProvider.updateInfo()) {
                            VStack(alignment: .leading) {
                                Text("\(UserProvider.shared.user?.firstName ?? L10n.Settings.UpdateInfo.firstName) \(UserProvider.shared.user?.lastName ?? L10n.Settings.UpdateInfo.lastName)")
                                    .font(.title3)
                                Text(L10n.Settings.UpdateInfo.subTitle)
                                    .font(.subheadline)
                            }
                            .padding(.vertical)
                        }
                    }
                    Section(header: Text("")) {
                        NavigationLink(destination: VStack {
                            Text("Page en cours de développement")
                        }) {
                            Text(L10n.Settings.onboarding)
                                .font(.title3)
                                .padding(.vertical)
                        }
                        NavigationLink(destination: VStack {
                            Text("Page en cours de développement")
                        }) {
                            Text(L10n.Settings.Payment.info)
                                .font(.title3)
                                .padding(.vertical)
                            
                        }
                        Text(L10n.Settings.Account.delete)
                            .font(.title3)
                            .padding(.vertical)
                            .onTapGesture {
                                viewModel.deleteUser()
                                viewModel.logout()
                                self.presentation.wrappedValue.dismiss()
                            }
                        Text(L10n.Settings.Account.logout)
                            .onTapGesture {
                                viewModel.logout()
                                self.presentation.wrappedValue.dismiss()
                            }
                            .font(.title3)
                            .padding(.vertical)
                            .foregroundColor(Color.bdePink)
                        
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle(L10n.Settings.title, displayMode: .automatic)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel())
    }
}
