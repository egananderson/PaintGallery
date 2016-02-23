//
//  Preview.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/7/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class Preview: UIControl {
    
    private var _redValue: Float = 0.5
    private var _greenValue: Float = 0.5
    private var _blueValue: Float = 0.5
    private var _width: Float = 25
    
    private var _endCapType: Int = 1
    private var _strokeJoinType: Int = 1
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContextRef? = UIGraphicsGetCurrentContext()

        CGContextSetStrokeColorWithColor(context, UIColor(red: CGFloat(_redValue), green: CGFloat(_greenValue), blue: CGFloat(_blueValue), alpha: 1.0).CGColor)
        CGContextSetLineWidth(context, CGFloat(_width))
        
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, bounds.width * 0.15, bounds.height * 0.3)
        CGContextAddLineToPoint(context, bounds.width * 0.3, bounds.height * 0.65)
        CGContextAddLineToPoint(context, bounds.width * 0.4, bounds.height * 0.3)
        CGContextAddLineToPoint(context, bounds.width * 0.6, bounds.height * 0.3)
        CGContextAddLineToPoint(context, bounds.width * 0.8, bounds.height * 0.6)
        CGContextAddLineToPoint(context, bounds.width * 0.85, bounds.height * 0.35)
        
        if(_endCapType == 0){
            CGContextSetLineCap(context, CGLineCap.Butt)
        } else if(_endCapType == 1){
            CGContextSetLineCap(context, CGLineCap.Round)
        } else {
            CGContextSetLineCap(context, CGLineCap.Square)
        }
        
        if(_strokeJoinType == 0){
            CGContextSetLineJoin(context, CGLineJoin.Miter)
        } else if(_strokeJoinType == 1){
            CGContextSetLineJoin(context, CGLineJoin.Round)
        } else {
            CGContextSetLineJoin(context, CGLineJoin.Bevel)
        }
        

        CGContextStrokePath(context)
    }
    
    var redValue: Float {
        get{ return _redValue }
        set{
            _redValue = newValue
            setNeedsDisplay()
        }
    }
    
    var greenValue: Float {
        get{ return _greenValue }
        set{
            _greenValue = newValue
            setNeedsDisplay()
        }
    }
    
    var blueValue: Float {
        get{ return _blueValue }
        set{
            _blueValue = newValue
            setNeedsDisplay()
        }
    }
    
    var width: Float {
        get{ return _width }
        set{
            _width = newValue
            setNeedsDisplay()
        }
    }
    
    var endCapType: Int {
        get{ return _endCapType }
        set{
            _endCapType = newValue
            setNeedsDisplay()
        }
    }
    
    var strokeJoinType: Int {
        get{ return _strokeJoinType }
        set{
            _strokeJoinType = newValue
            setNeedsDisplay()
        }
    }

}
