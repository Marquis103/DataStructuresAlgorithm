//
//  BinaryTreeTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/7/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class BinaryTreeTests: XCTestCase {
  
  var tree: BinaryNode<Int> = {
    let zero = BinaryNode<Int>(value: 0)
    let one = BinaryNode<Int>(value: 1)
    let five = BinaryNode<Int>(value: 5)
    let seven = BinaryNode<Int>(value: 7)
    let eight = BinaryNode<Int>(value: 8)
    let nine = BinaryNode<Int>(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
  }()
  
  func testVisualization() {
    print(tree)
  }
  
  func testTraverseInOrder() {
    var testArray: [Int] = []
    tree.traverseInOrder { testArray.append($0) }
    XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
  }
  
  func testTraversePreOrder() {
    var testArray: [Int] = []
    tree.traversePreOrder { testArray.append($0) }
    XCTAssertEqual(testArray, [7, 1, 0, 5, 9, 8])
  }
  
  func testTraversePostOrder() {
    var testArray: [Int] = []
    tree.traversePostOrder { testArray.append($0) }
    XCTAssertEqual(testArray, [0, 5, 1, 8, 9, 7])
  }
}
