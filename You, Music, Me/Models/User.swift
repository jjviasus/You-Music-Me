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

class User {
    var userID: String
    var name: String
    var gender: Gender
    var preference: Gender
    var favoriteArtists: [Artist]
    var matches: [User]
    var likedUsers: [User]
    
    init(name: String, gender: Gender, preference: Gender) {
        self.userID = UUID().uuidString // this needs to be uniquely generated for each user
        self.name = name
        self.gender = gender
        self.preference = preference
        self.favoriteArtists = []
        self.matches = []
        self.likedUsers = []
    }
    
    // MARK: Suggestions
    
    // Returns true if the other user has a favorite artist in common with this user, false otherwise.
    func shouldSuggestUser(otherUser: User) -> Bool {
        // TODO: this method can be improved
        for artist in self.favoriteArtists {
            for otherArtist in otherUser.favoriteArtists {
                if artist.artistID == otherArtist.artistID {
                    return true
                }
            }
        }
        return false
    }
    
    // MARK: Matches
    
    // Returns true if the other user has liked this user.
    func shouldMatchUsers(otherUser: User) -> Bool {
        return otherUser.likedUsers.contains { user in
            user.userID == self.userID
        }
    }
    
    // match with user
    
    // MARK: Favorite Artists
    
    // addFavoriteArtist
    
    // removeFavoriteArtist
    
    // MARK: Liking/Disliking Users
    
    // like user (don't suggest anymore)
    
    // dislike user (don't suggest anymore)
}
