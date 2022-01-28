//
//  User.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 1/27/22.
//

import Foundation

enum Gender {
    case male
    case female
}

class Artists {
    // probably provided by spotify
    let artistID: String
    
    init(artistID: String) {
        self.artistID = artistID
    }
}

class User {
    let name: String
    let gender: Gender
    let preference: Gender
    let favoriteArtists: [Artists]
    
    init(name: String, gender: Gender, preference: Gender, favoriteArtists: [Artists]) {
        self.name = name
        self.gender = gender
        self.preference = preference
        self.favoriteArtists = favoriteArtists
    }
}
