//
//  TicketmasterAuthManager.swift
//  You, Music, Me
//
//  Created by Justin Viasus on 2/8/22.
//

import Foundation

// A class with dummy data to use before the Tickermaster API is used
class TicketmasterAuthManager {
    
    // Returns a list of events for a particular artist within a given location
    static func getEvents(artist: Artist, location: String) -> [Event] {
        // location is the location of the user. We want to find events nearby them.
        
        // dummy data
        let events = [
            Event(eventID: "1", location: location, name: "\(artist.name) Summer Tour", artist: artist),
            Event(eventID: "2", location: location, name: "\(artist.name) Fall Tour", artist: artist),
            Event(eventID: "3", location: location, name: "\(artist.name) Winter Tour", artist: artist)
        ]
        
        return events
    }
}
