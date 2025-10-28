//
//  NetworkManagerTests.swift
//  GHFollowersTests
//
//  Created by Yaroslaw Homziak on 25.10.2025.
//

import XCTest
@testable import UIKIT_GHFollowers

final class NetworkManagerTests: XCTestCase {
     
    func testSuccessfulGetUserInfo() {
        
        // Arrange
        let validUserName = "Yaroslaw9050"
        let networkManager = NetworkManager.shared
        
        let expectation = self.expectation(description: "Get user infro from server")
        var recivedUser: User?
        var recivedError: GFError?
        
        // Act
        networkManager.getUserInfo(for: validUserName) { result in
            switch result {
            case .success(let success):
                recivedUser = success
            case .failure(let failure):
                recivedError = failure
            }
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        // Assert
        XCTAssertNil(recivedError, "Expected no error from valid username")
        XCTAssertNotNil(recivedUser, "Expected valid User object")
        XCTAssertEqual(recivedUser?.login, validUserName, "Expect correct user name in response")
    }
    
    func testCorrectErrorWithInvalidUserName() {
        
        //Arrage
        let invalidUsername = "oweijfsdkojfwoqpfjadf"
        let networkManager = NetworkManager.shared
        
        let expectation = self.expectation(description: "Get user info wirh invalid username")
        
        var recivedUsername: User?
        var recivedError: GFError?
        
        //Act
        networkManager.getUserInfo(for: invalidUsername) { result in
            switch result {
            case .success(let success):
                recivedUsername = success
            case .failure(let failure):
                recivedError = failure
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
        //Assert
        XCTAssertNil(recivedUsername, "Expect Nil from invalid username")
        XCTAssertNotNil(recivedError, "Ecpect error message from invalid user name")
        XCTAssertEqual(recivedError, .invalidResponse, "Expect invalid response type")
    }
    
    func testSuccessfulGetFollowers() {
        
        //Arrage
        let validUsername = "Yaroslaw9050"
        let networkManager = NetworkManager.shared
        let expectation = self.expectation(description: "Get user followers")
        
        var recivedFollowers: [Follower]?
        var recivedError: GFError?
        
        //Act
        networkManager.getFollowers(for: validUsername, page: 1) { result in
            switch result {
            case .success(let success):
                recivedFollowers = success
            case .failure(let failure):
                recivedError = failure
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
        //Assert
        XCTAssertNil(recivedError, "Expect no error from valid username wit followers")
        XCTAssertNotNil(recivedFollowers, "Expect followers list from valid username")
        XCTAssertNotEqual(recivedFollowers?.count, 0, "Expect some followers from valid username")
    }
}
