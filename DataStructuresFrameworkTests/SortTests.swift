//
//  BubbleSortTests.swift
//  DataStructuresFrameworkTests
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import XCTest
@testable import DataStructuresFramework

class SortTests: XCTestCase {
  var stringsArray: [String] = []
  var intsArray: [Int] = []
  
  override func setUp() {
    stringsArray.append("House")
    stringsArray.append("Clothes")
    stringsArray.append("Shoes")
    stringsArray.append("Car")
    
    intsArray.append(100)
    intsArray.append(4)
    intsArray.append(14)
    intsArray.append(39)
    intsArray.append(27)
    intsArray.append(11)
  }
  
  func testBubbleSort() {
    bubbleSort(&stringsArray)
    bubbleSort(&intsArray)
    XCTAssertEqual(stringsArray, ["Car", "Clothes", "House", "Shoes"])
    XCTAssertEqual(intsArray, [4, 11, 14, 27, 39, 100])
  }
  
  func testSelectionSort() {
    selectionSort(&stringsArray)
    selectionSort(&intsArray)
    XCTAssertEqual(stringsArray, ["Car", "Clothes", "House", "Shoes"])
    XCTAssertEqual(intsArray, [4, 11, 14, 27, 39, 100])
  }
  
  func testInsertionSort() {
    selectionSort(&stringsArray)
    insertionSort(&intsArray)
    XCTAssertEqual(stringsArray, ["Car", "Clothes", "House", "Shoes"])
    XCTAssertEqual(intsArray, [4, 11, 14, 27, 39, 100])
  }
  
  func testMergeSort() {
    XCTAssertEqual(mergeSort(stringsArray), ["Car", "Clothes", "House", "Shoes"])
    XCTAssertEqual(mergeSort(intsArray), [4, 11, 14, 27, 39, 100])
  }
}
