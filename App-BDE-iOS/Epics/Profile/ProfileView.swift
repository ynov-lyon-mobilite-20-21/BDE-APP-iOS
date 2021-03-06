//
//  ProfilView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        GeometryReader { gr in
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        HStack {
                            ZStack {
                                TitleShape(radius: 20)
                                    .fill(Color.blueToBlack)
                                HStack {
                                    Spacer()
                                    TitleCustom(title: L10n.Profil.userTitle, font: .custom("TabacBigSans-SemiBoldIt", size: 25), textColor: .white, shadowColor: .bdeGreen)
                                        .padding(.leading)
                                    Spacer()
                                }
                            }
                            .frame(width: gr.size.width * 0.7, height: 40)

                            Spacer()

                            Image(Asset.ynovCampus.name)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 70, maxHeight: 50)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            
                        }
                    }

                    ZStack {
                        // User info block
                        HStack {
                            // User Info
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    TitleCustom(title: "\(viewModel.user?.firstName ?? "") \(viewModel.user?.lastName.uppercased() ?? "")",
                                                font: Font.title3.weight(.bold),
                                                textColor: Color.blackToWhite,
                                                shadowColor: Color.bdeGreen)
                                    if viewModel.user != nil {
                                        Image(Asset.profilMenu.name)
                                            .renderingMode(.template)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .onTapGesture {
                                                viewModel.showSettings()
                                            }
                                            .frame(maxWidth: 30, maxHeight: 30)
                                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)

                                    }
                                    
                                }

                                Text("\(viewModel.user?.promotion.rawValue ?? "") \(viewModel.user?.formation.rawValue ?? "")")
                                Text(viewModel.user?.mail ?? "")
                            }
                            .padding()
                            Spacer()
                            VStack {
                                Spacer()
                                Image(viewModel.user?.formationImage ?? "")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .offset(x: 1, y: 2)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.whiteToBlack)
                        .cornerRadius(15)
                    }
                    .padding(6)
                    .frame(height: 150)
                    .background(LinearGradient(gradient: Gradient(colors: [.bdePink, .bdeGreen]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                    .padding([.horizontal, .top])

                    VStack {
                        HStack {
                            ZStack {
                                TitleShape(radius: 20)
                                    .fill(Color.blueToBlack)
                                HStack {
                                    Spacer()
                                    TitleCustom(title: L10n.Profil.ticketsTitle, font: .custom("TabacBigSans-SemiBoldIt", size: 25), textColor: .white, shadowColor: .bdeGreen)
                                        .padding(.leading)
                                    Spacer()
                                }
                            }
                            .frame(width: gr.size.width * 0.7, height: 35)
                            .padding(.top, 20)

                            Spacer()
                        }

                        Spacer()

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.userTickets, id: \._id) { ticket in

                                    TicketCard()
                                        .frame(width: gr.size.width * 0.6, height: gr.size.width * 0.6 * 1.4)
                                        .shadow(radius: 6)
                                        .onTapGesture {
                                            viewModel.showTicket(with: ticket)
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .background(
            ZStack {
                Color.whiteToBlue
                Image(Asset.backgroundEvent.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(colorScheme == .dark ? 0.2 : 1)
            }
            .ignoresSafeArea(edges: .top)
        )
        .sheet(item: $viewModel.showModal, onDismiss: { viewModel.redirectToEvent() }) { sheet in
            switch sheet {
            case .login:
                ViewProvider.signIn()
            case .settings:
                ViewProvider.settings()
            case .qrCode:
                ViewProvider.QRCode(ticket: viewModel.userTicket ?? Ticket(_id: "", eventId: "", userId: "", paymentId: "", validationCount: 0, qrCodeString: ""))
            }

        }
        
        .onAppear {
            viewModel.checkIfUserAuth()
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView(viewModel: ProfileViewModel())
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)

            ProfileView(viewModel: ProfileViewModel())
                .previewDevice("iPhone 8")
        }
    }
}
