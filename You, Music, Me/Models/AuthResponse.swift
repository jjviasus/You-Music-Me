//
//  AuthResponse.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/29/22.
//

import Foundation

struct AuthResponse: Codable { // Codable so we can automatically convert the json into this object
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
