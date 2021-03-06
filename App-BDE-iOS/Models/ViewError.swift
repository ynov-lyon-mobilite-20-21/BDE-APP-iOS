//
//  ViewError.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 17/02/2021.
//

import Foundation
import SwiftUI

struct ViewError: Error, Identifiable {
    let errorCode: ErrorCode
    var id: String { errorCode.rawValue }

    var title: String {  NSLocalizedString("error.alert.\(errorCode).title", comment: "") }
    var description: String {  NSLocalizedString("error.alert.\(errorCode).description", comment: "") }

    enum ErrorCode: String {
        case UNKNOW_ERROR
        case PARTY_REFUSED
        case TOKEN_NOT_FOUND
        case USER_INACTIVE
        case BAD_CREDENTIALS
        case EMAIL_REQUIRED
        case PASSWORD_REQUIRED
        case FIRSTNAME_REQUIRED
        case LASTNAME_REQUIRED
    }
}
