//
//  QueueTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class QueueTests: XCTestCase {
  var queueArray = QueueArray<String>()
  var queueStack = QueueStack<String>()
  
  override func setUp() {
    queueArray.enqueue("Pusheen")
    queueArray.enqueue("Keyboard Cat")
    queueArray.enqueue("Lil Bub")
    
    queueStack.enqueue("Milo")
    queueStack.enqueue("Sassy")
    queueStack.enqueue("Ozma")
  }
  
  func testEnqueueArray() {
    XCTAssertEqual(queueArray.peek, "Pusheen")
  }
  
  func testEnqueueStack() {
     XCTAssertEqual(queueStack.peek, "Milo")
  }
  
  func testDequeueArray() {
    queueArray.dequeue()
    queueArray.dequeue()
    XCTAssertEqual(queueArray.peek, "Lil Bub")
    queueArray.dequeue()
    XCTAssertTrue(queueArray.isEmpty)
  }
  
  func testDequeueStack() {
    queueStack.dequeue()
    queueStack.dequeue()
    XCTAssertEqual(queueStack.peek, "Ozma")
    queueStack.dequeue()
    XCTAssertTrue(queueStack.isEmpty)
  }
}
