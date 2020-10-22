//
//  EventView.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 22/10/2020.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            Text("Hello, Events!")
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
