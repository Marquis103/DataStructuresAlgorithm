//
//  LinkedList.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/10/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

/*
 Base object of a LinkedList is a node
 Node should contain a way to initialize a value and a way to access as a pointer
 to the next value
 
 Linked List class uses nodes to initialize a list and also carry out operations
 of linked lists
 
 Retrieving, Appending, Inserting, Deleting
*/

class LinkedListNode<Element>: Node {
  typealias Element = Element
  var value: Element
  var next: LinkedListNode?
  
  required init(value: Element) {
    self.value = value
  }
}

class LinkedList<T: Equatable> {
  var head: LinkedListNode<T>?
  
  init(value: LinkedListNode<T>) {
    self.head = value
  }
  
  func append(_ node: LinkedListNode<T>) {
    guard head != nil else {
      self.head = node
      return
    }
    
    var current = head
    while let _ = current?.next {
      current = current?.next
    }
    
    current?.next = node
  }
  
  func getNode(atPosition position: Int) -> LinkedListNode<T>? {
    //always expect a positive position
    guard position >= 0 else { return nil }
    
    //counter for keep track of iterating over nodes
    var i = 0
    
    //start with value initially as head
    var current = head
    
    while current != nil && i <= position {
      if i == position {
        return current
      }
      
      //attempt to try next value
      current = current?.next
      i += 1
    }
    
    return nil
  }
  
  func insertNode(_ node: LinkedListNode<T>, at position: Int) {
    guard position >= 0 else { return }
    
    var i = 0
    var current = head
    
    if position > 0 {
      while current != nil && i <= position {
        if i == position - 1 {
          node.next = current?.next
          current?.next = node
          break
        }
        
        current = current?.next
        i += 1
      }
    } else if position == 0 {
      node.next = head
      head = node
    }
  }
  
  func deleteNode(withValue value: T) {
    var current = head
    var previousNode: LinkedListNode<T>?
    
    while let currentValue = current?.value, currentValue != value {
      previousNode = current
      current = current?.next
    }
    
    if previousNode == nil {
      head = current?.next
    } else {
      previousNode?.next = current?.next
    }
    
    current?.next = nil
  }
}


