//
//  NetworkTest.swift
//  SportifyTests
//
//  Created by ME on 26/05/2023.
//

import XCTest
@testable import Sportify

final class NetworkTest: XCTestCase {
    let network = Network()
    let leagueURL = "/?met=Leagues&APIkey=\(K.APIKey)"
    let EventsURL = "/?met=Fixtures&APIkey=\(K.APIKey)"
    var teamsUrl = "/?met=Teams&APIkey=\(K.APIKey)"
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetLeaguesList(){
        let expect = expectation(description: "waitin for leagues from API")
        network.getLeaguesList(sportName: K.SportName.footbaall) { leagues  in
        
        XCTAssertGreaterThan(leagues.count, 0)
            expect.fulfill()
        }
        waitForExpectations(timeout: 8)
    }
    
    func testGetLeagueEvent(){
        let expect = expectation(description: "waitin for events from API")
        network.getLeagueEvent(url:  "\(K.baseUrl)\(K.SportName.footbaall)\(EventsURL)&leagueId=\(4)&from=\(K.getCurrentDate())&to=\(K.getNextDate())") { (events) in
            XCTAssertGreaterThan(events.count, 0)
                expect.fulfill()
        }
        waitForExpectations(timeout: 8)
    }
    
    func testGetTeams(){
        let expect = expectation(description: "waitin for teams from API")
        network.getTeams(url:  "\(K.baseUrl)\(K.SportName.footbaall)\(teamsUrl)&leagueId=\(4)") { teams in
            XCTAssertGreaterThan(teams.count, 0)
                expect.fulfill()
        }
        waitForExpectations(timeout: 8)
        }
    
    
    func testGetTeamById(){
        let expect = expectation(description: "waitin for team from API")
        network.getTeamById(url: "\(K.baseUrl)\(K.SportName.footbaall)\(teamsUrl)&teamId=\(1)") { team in
            //XCTAssertGreaterThan(team.players?.count ?? 0, 0)
            XCTAssertNotNil(team)
            expect.fulfill()
        }
        waitForExpectations(timeout: 8)
    }
}
