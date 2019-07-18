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
 
 Operations:
 remove - O(log n)
 insert - O(log n)
 search - O(n)
 peek - O(1)
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
  
  func getFirstIndex(of element: Element, startingAt startingIndex: Int = 0) -> Int? {
    guard elements.indices.contains(startingIndex) else {
      return nil
    }
    
    if areSorted(element, elements[startingIndex]) {
      return nil
    }
    
    if element == elements[startingIndex] {
      return startingIndex
    }
    
    let childIndices = getChildIndices(ofParent: startingIndex)
    return getFirstIndex(of: element, startingAt: childIndices.left) ?? getFirstIndex(of: element, startingAt: childIndices.right)
  }
  
  mutating func removeRoot() -> Element? {
    guard !isEmpty else { return nil }
    
    elements.swapAt(0, count - 1)
    let originalRoot = elements.removeLast()
    siftDown(from: 0)
    return originalRoot
  }
  
  mutating func insert(_ element: Element) {
    elements.append(element)
    siftUp(from: elements.count - 1)
  }
  
  mutating func remove(at index: Int) -> Element? {
    guard index < elements.count else {
      return nil
    }
    
    if index == elements.count - 1 {
      return elements.removeLast()
    } else {
      elements.swapAt(index, elements.count - 1)
      defer {
        siftUp(from: index)
        siftDown(from: index)
      }
      
      return elements.removeLast()
    }
  }
  
  ///
  /// Sift down is O(n)
  ///
  mutating func siftDown(from index: Int, upTo count: Int? = nil) {
    let count = count ?? self.count
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
  
  mutating func siftUp(from index: Int) {
    var childIndex = index
    var parentIndex = getParentIndex(ofChild: childIndex)
    
    while childIndex > 0 && areSorted(elements[childIndex], elements[parentIndex]) {
      elements.swapAt(childIndex, parentIndex)
      childIndex = parentIndex
      parentIndex = getParentIndex(ofChild: childIndex)
    }
  }
}

extension Array where Element: Equatable {
  // Heap sort O(n log n)
  init(_ heap: Heap<Element>) {
    var heap = heap
    for index in heap.elements.indices.reversed() {
      heap.elements.swapAt(0, index)
      heap.siftDown(from: 0, upTo: index)
    }
    
    self = heap.elements
  }
  
  func isHeap(sortedBy areSorted: @escaping (Element, Element) -> Bool) -> Bool {
    if isEmpty {
      return true
    }
    
    for parentIndex in stride(from: count / 2 - 1, through: 0, by: -1) {
      let parent = self[parentIndex]
      let leftChildIndex = 2 * parentIndex + 1
      if areSorted(self[leftChildIndex], parent) {
        return false
      }
      let rightChildIndex = leftChildIndex + 1
      if rightChildIndex < count && areSorted(self[rightChildIndex], parent) {
        return false
      }
    }
    
    return true
  }
}
