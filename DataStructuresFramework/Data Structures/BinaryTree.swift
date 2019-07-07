//
//  BinaryTree.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/7/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

protocol Node {
  associatedtype Element
  var value: Element { get set }
  init(value: Element)
}

class BinaryNode<Element>: Node {
  typealias Element = Element
  
  var value: Element
  var leftChild: BinaryNode<Element>?
  var rightChild: BinaryNode<Element>?
  
  required init(value: Element) {
    self.value = value
  }
}

extension BinaryNode {
  func traverseInOrder(visit: (Element) -> Void) {
    leftChild?.traverseInOrder(visit: visit)
    visit(value)
    rightChild?.traverseInOrder(visit: visit)
  }
  
  func traversePreOrder(visit: (Element) -> Void) {
    visit(value)
    leftChild?.traversePreOrder(visit: visit)
    rightChild?.traversePreOrder(visit: visit)
  }
  
  func traversePostOrder(visit: (Element) -> Void) {
    leftChild?.traversePostOrder(visit: visit)
    rightChild?.traversePostOrder(visit: visit)
    visit(value)
  }
}

extension BinaryNode: CustomStringConvertible {
  //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
  
  public var description: String {
    return diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.leftChild,
                bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
