//
//  Heap.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/10/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

/*
 Max Heap - Highest Value (root)
 Min Heap - Lowest Value (root
 Full Tree - All Tree nodes full (Binary Tree)
 Complete Tree - All nodes filled to the leaf nodes, filling left to right
 
 Can store any type as long as it's equatable
 
 Primary Functions:
 SiftDown
 Remove Root
*/

struct Heap<Element: Equatable> {
  fileprivate var elements: [Element] = []
  
  // min or max heap
  let areSorted: (Element, Element) -> Bool
  
  init(_ elements: [Element], areSorted: @escaping (Element, Element) -> Bool) {
    self.areSorted = areSorted
    self.elements = elements
    
    guard !elements.isEmpty else { return }
    
    for index in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
      siftDown(from: index)
    }
  }
  
  var isEmpty: Bool {
    return elements.isEmpty
  }
  
  func peek() -> Element? {
    return elements.first
  }
  
  var count: Int {
    return elements.count
  }
  
  func getChildIndices(ofParent at: Int) -> (left: Int, right: Int) {
    let leftIndex = (2 * at) + 1
    return (leftIndex, leftIndex + 1)
  }
  
  func getParentIndex(ofChild at: Int) -> Int {
    return (at - 1) / 2
  }
  
  mutating func removeRoot() -> Element? {
    guard !isEmpty else { return nil }
    
    elements.swapAt(0, count - 1)
    let originalRoot = elements.removeLast()
    siftDown(from: 0)
    return originalRoot
  }
  
  mutating func siftDown(from index: Int) {
    var parentIndex = index
    while true {
      let (leftIndex, rightIndex) = getChildIndices(ofParent: parentIndex)
      var optionalParentSwapIndex: Int?
      
      if leftIndex < count && areSorted(elements[leftIndex], elements[parentIndex]) {
        optionalParentSwapIndex = leftIndex
      }
      
      if rightIndex < count && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
        optionalParentSwapIndex = rightIndex
      }
    
      guard let parentSwapIndex = optionalParentSwapIndex else {
        return
      }
      
      elements.swapAt(parentIndex, parentSwapIndex)
      parentIndex = parentSwapIndex
    }
  }
}
