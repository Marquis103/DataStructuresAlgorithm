//
//  PriorityQueueTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/17/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class PriorityQueueTests: XCTestCase {
  func test() {
    let priorityQueue = PriorityQueue(unsortedInts, areSorted: <)
    XCTAssertEqual(priorityQueue.map { $0 }, unsortedInts.sorted())
  }
  
  private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]
}
