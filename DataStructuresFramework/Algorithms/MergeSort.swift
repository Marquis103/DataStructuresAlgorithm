//
//  MergeSort.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

///
/// Divide and Conquer Big O(n log n)
///
func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
  guard array.count > 1 else { return array }
  
  let middle = array.count / 2
  let left = mergeSort(Array(array[..<middle]))
  let right = mergeSort(Array(array[middle...]))
  
  return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
  var leftIndex = 0
  var rightIndex = 0
  var result: [Element] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]
    
    if leftElement < rightElement {
      result.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      result.append(rightElement)
      rightIndex += 1
    } else {
      result.append(leftElement)
      result.append(rightElement)
      
      leftIndex += 1
      rightIndex += 1
    }
  }
  
  if leftIndex < left.count {
    result.append(contentsOf: left[leftIndex...])
  }
  
  if rightIndex < right.count {
    result.append(contentsOf: right[rightIndex...])
  }
  
  return result
}
