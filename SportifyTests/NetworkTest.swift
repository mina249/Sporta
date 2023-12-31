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
        network.getLeaguesList(sportName: K.SportName.footbaall) { leagues , error in
          if error != nil {
                XCTFail()
                expect.fulfill()
          }else{
              if let leagues = leagues{
                  XCTAssertGreaterThan(leagues.count, 0)
                  expect.fulfill()
              }
          }
        }
        waitForExpectations(timeout: 8)
    }
    
    func testGetLeagueEvent(){
        let expect = expectation(description: "waitin for events from API")
        network.getLeagueEvent(url:  "\(K.baseUrl)\(K.SportName.footbaall)\(EventsURL)&leagueId=\(45)&from=2023-05-1&to=2023-06-1") { (events , error) in
            if error != nil{
                XCTFail()
                expect.fulfill()
            }else{
                if let events  = events{
                    XCTAssertNotNil(events.count)
                    expect.fulfill()
                }
            }
            
        }
        waitForExpectations(timeout: 20)
    }
    func testGetTeams(){
        let expect = expectation(description: "waitin for teams from API")
        network.getTeams(url:  "\(K.baseUrl)\(K.SportName.footbaall)\(teamsUrl)&leagueId=\(4)") { teams , error in
            if error != nil{
                XCTFail()
                expect.fulfill()
            }else{
                if let teams = teams{
                    XCTAssertGreaterThan(teams.count, 0)
                    expect.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 8)
        
    }
    
    
    func testGetTeamById(){
        let expect = expectation(description: "waitin for team from API")
        network.getTeamById(url: "\(K.baseUrl)\(K.SportName.footbaall)\(teamsUrl)&teamId=\(1)") { team , error in
            if error != nil {
                XCTFail()
                expect.fulfill()
            }else{
                if let team = team{
                    XCTAssertNotNil(team)
                    expect.fulfill()
                }
            }
            
        }
        waitForExpectations(timeout: 8)
    }
}
