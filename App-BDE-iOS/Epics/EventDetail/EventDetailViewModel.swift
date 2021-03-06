//
//  EventDetailViewModel.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 28/03/2021.
//

import Foundation
import SwiftUI

class EventDetailViewModel: BaseViewModel {
    
    func setup(event: Event) {
        self.event = event
    }
    
    var event: Event!
    var showModal: Sheet? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    enum Sheet: String, Identifiable {
        var id: String {
            rawValue
        }
        case qrCodeScanner
        case checkoutPayment
    }
    
    func showQrCodeScanner() {
        showModal = .qrCodeScanner
    }
    
    func showCheckoutPayment() {
        showModal = .checkoutPayment
    }
}
