//
//  PriorityQueue.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/17/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
  private var heap: Heap<Element>
  
  init(_ elements: [Element], areSorted: @escaping (Element, Element) -> Bool) {
    heap = Heap(elements, areSorted: areSorted)
  }
  
  mutating func enqueue(_ element: Element) {
    heap.insert(element)
  }
  
  mutating func dequeue() -> Element? {
    return heap.removeRoot()
  }
  
  var isEmpty: Bool {
    return heap.isEmpty
  }
  
  var peek: Element? {
    return heap.peek()
  }
}
