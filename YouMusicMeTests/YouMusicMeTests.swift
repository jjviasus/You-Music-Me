//
//  YouMusicMeTests.swift
//  YouMusicMeTests
//
//  Created by Justin Viasus on 2/4/22.
//

import XCTest
@testable import You__Music__Me // this gives the unit tests access to the internal types and functions in our project

class YouMusicMeTests: XCTestCase {
    
    var sut: User! // System Under Test (the object this test case class is concerned with testing)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = User(name: "Justin Viasus", gender: Gender.male, preference: Gender.female) // this creates User() at the class level, so all the tests in this class can access the SUT object's properties and methods.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil // release SUT object in tear down to ensure every test starts with a clean slate.
        try super.tearDownWithError()
    }
    
    func testShouldSuggestUserIsTrue() {
        // given
        let otherUser = User(name: "Teodora Misic", gender: Gender.female, preference: Gender.male)
        let similarArtist = Artist(artistID: "similarArtist")
        let notSimilarArtist = Artist(artistID: "notSimilarArtist")
        otherUser.favoriteArtists = [similarArtist, notSimilarArtist]
        
        sut.favoriteArtists = [similarArtist]
                
        // when
        let result = sut.shouldSuggestUser(otherUser: otherUser)
        
        // then
        XCTAssertEqual(result, true)
    }
    
    func testShouldSuggestUserIsFalse() {
        // given
        let otherUser = User(name: "Teodora Misic", gender: Gender.female, preference: Gender.male)
        let artist1 = Artist(artistID: "artist1")
        otherUser.favoriteArtists = [artist1]

        let artist2 = Artist(artistID: "artist2")
        sut.favoriteArtists = [artist2]
                
        // when
        let result = sut.shouldSuggestUser(otherUser: otherUser)
        
        // then
        XCTAssertEqual(result, false)
    }
    
}
