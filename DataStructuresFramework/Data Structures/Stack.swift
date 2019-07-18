//
//  Stack.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

/*
 - Stack have push operations and pop
 - Check if a stack is empty
 - Peek allows you to peek at the top of the stack
 - 
*/
struct Stack<Element: Equatable>: Equatable {
  private var storage: [Element] = []
  
  /// Initialize an empty stack
  init() {}
  
  /// Initialize stack with an array
  init(_ elements: [Element]) {
    storage = elements
  }
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  @discardableResult
  mutating func pop() -> Element? {
    return storage.popLast()
  }
  
  func peek() -> Element? {
    return storage.last
  }
  
  var isEmpty: Bool {
    return peek() == nil
  }
}

extension Stack: CustomStringConvertible {
  var description: String {
    return storage
      .map { "\($0)" }
      .joined(separator: " ")
  }
}

extension Stack: ExpressibleByArrayLiteral {
  init(arrayLiteral elements: Element...) {
    storage = elements
  }
}
