//
//  Artist.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 2/4/22.
//

import Foundation

class Artist {
    // probably provided by spotify
    let artistID: String
    let name: String
    
    init(artistID: String, name: String) {
        self.artistID = artistID
        self.name = name
    }
}
