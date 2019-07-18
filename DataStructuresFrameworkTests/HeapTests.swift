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
  private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]
  
  func testInit() {
    let heap = Heap(unsortedInts, areSorted: <)
    XCTAssertEqual(unsortedInts.sorted(by: >), Array(heap) )
  }
  
  func testRemoveRoot() {
    // Max heap root node 12
    var heap = Heap(unsortedInts, areSorted: >)
    XCTAssertEqual(heap.removeRoot(), 12)
  }
  
  func testRemove() {
    var heap = Heap(unsortedInts, areSorted: >)
    let index = heap.getFirstIndex(of: 3)!
    XCTAssertEqual(heap.remove(at: index), 3)
    XCTAssertEqual(Array(heap), [1, 1, 4, 6, 7, 8, 12])
  }
  
  func testInsert() {
    var heap = Heap(unsortedInts, areSorted: >)
    heap.insert(5)
    XCTAssertEqual(Array(heap), [1, 1, 3, 4, 5, 6, 7, 8, 12])
  }
  
  func testPeek() {
    // Max heap root node 12
    let heap = Heap(unsortedInts, areSorted: >)
    XCTAssertEqual(heap.peek(), 12)
  }
  
  // Write tests for heaps
}
