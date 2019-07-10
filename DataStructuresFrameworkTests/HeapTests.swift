//
//  HeapTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/10/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class HeapTests: XCTestCase {
  private let unsortedInts = [1, 12, 3, 4, 1, 5, 8, 7]
  
  func testRemoveRoot() {
    // Max heap root node 12
    var heap = Heap(unsortedInts, areSorted: >)
    XCTAssertEqual(heap.removeRoot(), 12)
  }
  
  func testPeek() {
    // Max heap root node 12
    let heap = Heap(unsortedInts, areSorted: >)
    XCTAssertEqual(heap.peek(), 12)
  }
}
