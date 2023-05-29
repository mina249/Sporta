//
//  FakeNetworkTest.swift
//  SportifyTests
//
//  Created by ME on 27/05/2023.
//

import XCTest
@testable import Sportify

final class FakeNetworkTest: XCTestCase {
    var network : NetworkProtocol!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetLeaguesListShouldPass(){
        network = FakeNetowrk(shouldReturnError: false)
        network?.getLeaguesList(sportName: K.SportName.footbaall, completionHandler: { leagues , error in
            if leagues != nil {
                XCTAssertNotNil(leagues,"there no leagues invalid model")
            }else{
              
                XCTFail()
                return
            }
        })
    }
    
    func testGetLeaguesListShouldFail(){
        network = FakeNetowrk(shouldReturnError: true)
        network.getLeaguesList(sportName:"") { leagues, error in
            XCTAssertNil(leagues, "Items Not nil")
        }
    }
    
    func testGetLeagueEventShouldPass(){
        network = FakeNetowrk(shouldReturnError: false)
        network?.getLeagueEvent(url:"", completionHandler: { events , error in
            if events != nil {
                XCTAssertNotNil(events,"there no leagues invalid model")
            }else{
                XCTFail()
                return
            }
        })
    }
    
    func testGetLeagueEventsShouldFail(){
        network = FakeNetowrk(shouldReturnError: true)
        network.getLeagueEvent(url:"") { events, error in
            XCTAssertNil(events, "Items Not nil")
        }
    }
    func testGetTeamsShouldPass(){
        network = FakeNetowrk(shouldReturnError: false)
        network?.getTeams(url:"", completionHandler: { teams , error in
            if teams != nil {
                XCTAssertNotNil(teams,"there no leagues invalid model")
            }else{
                XCTFail()
                return
            }
        })
    }
    
    func testGetTeamsShouldFail(){
        network = FakeNetowrk(shouldReturnError: true)
        network.getTeams(url:"") { teams, error in
            XCTAssertNil(teams, "Items Not nil")
        }
    }
    
    func testGetTeamByIdShouldPass(){
        network = FakeNetowrk(shouldReturnError: false)
        network?.getTeamById(url:"", completionHandler: { team , error in
            if team != nil {
                XCTAssertNotNil(team,"there no leagues invalid model")
            }else{
                XCTFail()
                return
            }
        })
    }
    
    func testGetTeamByIdShouldFail(){
        network = FakeNetowrk(shouldReturnError: true)
        network.getTeamById(url:"") { team, error in
            XCTAssertNil(team, "Items Not nil")
        }
    }
}
