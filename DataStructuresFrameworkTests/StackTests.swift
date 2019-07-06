//
//  StackTest.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class StackTest: XCTestCase {
  var stack = Stack<Int>()
  
  override func setUp() {
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    stack.push(5)
    stack.push(6)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testPush() {
    XCTAssertNotEqual(stack.description, "323428934234")
    XCTAssertEqual(stack.description, "1 2 3 4 5 6")
  }
  
  func testPop() {
    XCTAssertEqual(stack.pop(), 6)
  }
  
  func testPeek() {
    XCTAssertEqual(stack.peek(), 6)
  }
  
  func testIsEmpty() {
    XCTAssertEqual(stack.isEmpty, false)
  }
  
  func testInitWithArray() {
    let array = [1, 2, 3, 4, 5, 6]
    XCTAssertEqual(stack, Stack(array))
  }
  
  func testArrayLiteral() {
    let stack: Stack = ["blueberry", "strawberry", "plain", "potato"]
    XCTAssertEqual(stack, ["blueberry", "strawberry", "plain", "potato"])
  }
  
  func testCheckParentheses() {
    XCTAssertEqual(checkForBalancedParentheses("helloWorld()"), true)
    XCTAssertEqual(checkForBalancedParentheses("()helloWorld))"), false)
  }
  
  func checkForBalancedParentheses(_ string: String) -> Bool {
    var isOpen = false
    
    var stack = string
    
    while !stack.isEmpty {
      let character = stack.popLast()
      switch (character, isOpen) {
      case (")", true):
        return false
      case ("(", false):
        return false
      case (")", false):
        isOpen = true
        continue
      case ("(", true):
        isOpen = false
        continue
      default:
        continue
      }
    }
    
    return true
  }
}

