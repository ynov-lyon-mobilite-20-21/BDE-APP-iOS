//
//  AuthenticationRequests.swift
//  FYD
//
//  Created by Maxence Mottard on 30/10/2020.
//  Copyright © 2020 Nicolas Barbosa. All rights reserved.
//

import Foundation
import Combine

struct RegisterWebServiceParameters: Encodable {
    var mail: String
    var password: String
}

final class LoginWebService: WebService {

    typealias DecodedType = AuthToken
    typealias ServiceParameters = RegisterWebServiceParameters

    var url: String = "https://lyon-ynov-bde-api.herokuapp.com/api/auth/login"

    var httpMethod: HTTPMethod = .POST

    var headers: [String: String] = [:]

}
