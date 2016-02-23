//
//  Stroke.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/22/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class Stroke{
    private var _points: Array<[Float]>?
    
    private var _redValue: Float?
    private var _greenValue: Float?
    private var _blueValue: Float?
    private var _width: Float?
    
    private var _endCapType: Int?
    private var _strokeJoinType: Int?
    
    init() {
        _points = Array<[Float]>()
    }
    
    init(otherObject: Stroke) {
        _points = Array<[Float]>()
        
        _redValue = otherObject.redValue
        _greenValue = otherObject.greenValue
        _blueValue = otherObject.blueValue
        _width = otherObject.width
        _endCapType = otherObject.endCapType
        _strokeJoinType = otherObject.strokeJoinType
    }
    
    func copy() -> Stroke {
        return Stroke(otherObject: self)
    }
    
    func addPoint(point: [Float]){
        _points!.append(point)
    }
    
    var points: Array<[Float]> {
        get{ return _points! }
    }
    
    var redValue: Float {
        get{ return _redValue! }
        set{
            _redValue = newValue
        }
    }
    
    var greenValue: Float {
        get{ return _greenValue! }
        set{
            _greenValue = newValue
        }
    }
    
    var blueValue: Float {
        get{ return _blueValue! }
        set{
            _blueValue = newValue
        }
    }
    
    var width: Float {
        get{ return _width! }
        set{
            _width = newValue
        }
    }
    
    var endCapType: Int {
        get{ return _endCapType! }
        set{
            _endCapType = newValue
        }
    }
    
    var strokeJoinType: Int {
        get{ return _strokeJoinType! }
        set{
            _strokeJoinType = newValue
        }
    }
    
}

