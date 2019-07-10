//
//  LinkedListTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/10/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class LinkedListTests: XCTestCase {
  var linkedList = LinkedList<Int>(value: LinkedListNode<Int>(value: 1))
  let n4 = LinkedListNode<Int>(value: 4)
  
  override func setUp() {
    // Set up some Nodes
    let n2 = LinkedListNode<Int>(value: 2)
    let n3 = LinkedListNode<Int>(value: 3)
    
    linkedList.append(n2)
    linkedList.append(n3)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testLinkedList() {
    // Test getNode(atPosition:)
    XCTAssertEqual(linkedList.head?.next?.next?.value ?? 0, 3)
    XCTAssertEqual(linkedList.getNode(atPosition: 2)?.value ?? 0, 3)
    
    // Test insert
    linkedList.insertNode(n4, at: 2)
    XCTAssertEqual(linkedList.getNode(atPosition: 2)?.value ?? 0, 4)
    
    // Test delete(withValue:)
    linkedList.deleteNode(withValue: 1)
    XCTAssertEqual(linkedList.getNode(atPosition: 0)?.value ?? 0, 2)
    XCTAssertEqual(linkedList.getNode(atPosition: 1)?.value ?? 0, 4)
    XCTAssertEqual(linkedList.getNode(atPosition: 2)?.value ?? 0, 3)
  }
}
