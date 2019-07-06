//
//  Queue.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

protocol Queue {
  associatedtype Element
  
  mutating func enqueue(_ element: Element)
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

struct QueueArray<T>: Queue {
  typealias Element = T
  
  private var array: [T] = []
  
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var peek: T? {
    return array.first
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    return isEmpty ? nil : array.removeFirst()
  }
}

struct QueueStack<T: Equatable>: Queue {
  private var dequeueStack = Stack<T>()
  private var enqueueStack = Stack<T>()
  private var front: T?
  
  typealias Element = T
  
  mutating func enqueue(_ element: T) {
    if enqueueStack.isEmpty {
      front = element
    }
    
    enqueueStack.push(element)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    if dequeueStack.isEmpty {
      while !enqueueStack.isEmpty {
        if let element = enqueueStack.pop() {
          dequeueStack.push(element)
        }
      }
    }
    
    let poppedElement = dequeueStack.pop()
    front = dequeueStack.peek()
    return poppedElement
  }
  
  var isEmpty: Bool {
    return dequeueStack.isEmpty && enqueueStack.isEmpty
  }
  
  var peek: T? {
    return dequeueStack.isEmpty ? front : dequeueStack.peek()
  }
}

/*
 Array Queue
 enqueue O(1)
 dequeue(n)
 Space Complexity O(n)
 
 Double Stack
 enqueue O(1)
 dequeue O(1)
 Space Complexity O(n)
*/
