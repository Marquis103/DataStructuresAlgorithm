//
//  BubbleSort.swift
//  DataStructuresFramework
//
//  Created by Marquis Dennis on 7/6/19.
//  Copyright © 2019 thatSwiftGuy. All rights reserved.
//

import Foundation

func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
  guard array.count >= 2 else { return }
  
  for end in (1..<array.count).reversed() {
    var swapped = false
    for current in 0..<end {
      if array[current] > array[current + 1] {
        array.swapAt(current, current + 1)
        swapped = true
      }
    }
    
    if !swapped { return }
  }
}
