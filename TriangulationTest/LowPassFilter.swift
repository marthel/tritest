//
//  LowPassFilter.swift
//  TriangulationTest
//
//  Created by Martin on 09/02/2017.
//  Copyright © 2017 Martin. All rights reserved.
//

import Foundation

struct LowPassFilterSignal {
    /// Current signal value
    var value: Double
    
    /// A scaling factor in the range 0.0..<1.0 that determines
    /// how resistant the value is to change
    let filterFactor: Double
    
    /// Update the value, using filterFactor to attenuate changes
    mutating func update(newValue: Double) {
        value = filterFactor * value + (1.0 - filterFactor) * newValue
    }
}
