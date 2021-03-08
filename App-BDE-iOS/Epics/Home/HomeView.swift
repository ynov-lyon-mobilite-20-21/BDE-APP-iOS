//
//  MainView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 24/10/2020.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    @State private var showModal: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.tabViewProvider.currentTab) {
                ViewProvider.event()
                    .tabItem {
                        Image("ticket_noir")
                            .renderingMode(.template)
                            .foregroundColor(Color.blackToWhite)
                        Text("Evennement")
                    }
                    .tag(TabViewProvider.Tabs.event)
                
                ViewProvider.profile()
                    .tabItem {
                        Image("profil_noir")
                            .renderingMode(.template)
                            .foregroundColor(Color.blackToWhite)
                        Text("Mon compte")
                    }
                    .tag(TabViewProvider.Tabs.profil)
            }
            .accentColor(.blackToWhite)

            BottomTabBarModalItem {
                self.showModal.toggle()
            }.offset(y: -8)
        }
        .sheet(isPresented: self.$showModal) { ContactsView() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(viewModel: HomeViewModel())
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 11")
            HomeView(viewModel: HomeViewModel())
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
