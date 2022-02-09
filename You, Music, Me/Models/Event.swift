//
//  Event.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 2/8/22.
//

import Foundation

class Event {
    let eventID: String
    var location: String
    var name: String
    var artist: Artist
    
    // The passed in eventID will be retrived from ticketmaster
    init(eventID: String, location: String, name: String, artist: Artist) {
        self.eventID = eventID
        self.location = location
        self.name = name
        self.artist = artist
    }
}
