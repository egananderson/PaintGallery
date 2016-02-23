//
//  Painting.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/21/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class Painting: UIControl {
    
    private var _strokes: Array<Stroke> = Array<Stroke>()
    private var _stroke: Stroke = Stroke()
    private var _brushChooserViewController: BrushChooserViewController?
    private var _undoStrokes: Array<Stroke> = Array<Stroke>()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        _strokes.append(_stroke)
        _stroke.addPoint(convertPointToFloatCoordinates(touch.locationInView(self)))
        _undoStrokes = Array<Stroke>()
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touch: UITouch = touches.first!
        _stroke.addPoint(convertPointToFloatCoordinates(touch.locationInView(self)))
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        let touch: UITouch = touches.first!
        _stroke.addPoint(convertPointToFloatCoordinates(touch.locationInView(self)))
        setNeedsDisplay()
        _stroke = Stroke(otherObject: _stroke)
    }
    
    func convertPointToFloatCoordinates(point: CGPoint) -> [Float]{
        var floatPoint: [Float] = [0, 0]
        floatPoint[0] = Float(point.x / self.bounds.width)
        floatPoint[1] = Float(point.y / self.bounds.height)
        return floatPoint;
    }

    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
        
       
        
        CGContextBeginPath(context)
        if(_strokes.count > 0){
            for stroke in _strokes{
                
                CGContextSetStrokeColorWithColor(context, UIColor(red: CGFloat(stroke.redValue), green: CGFloat(stroke.greenValue), blue: CGFloat(stroke.blueValue), alpha: 1.0).CGColor)
                CGContextSetLineWidth(context, CGFloat(stroke.width))
                
                if(stroke.endCapType == 0){
                    CGContextSetLineCap(context, CGLineCap.Butt)
                } else if(stroke.endCapType == 1){
                    CGContextSetLineCap(context, CGLineCap.Round)
                } else {
                    CGContextSetLineCap(context, CGLineCap.Square)
                }
                
                if(stroke.strokeJoinType == 0){
                    CGContextSetLineJoin(context, CGLineJoin.Miter)
                } else if(stroke.strokeJoinType == 1){
                    CGContextSetLineJoin(context, CGLineJoin.Round)
                } else {
                    CGContextSetLineJoin(context, CGLineJoin.Bevel)
                }
                
                CGContextMoveToPoint(context, CGFloat(stroke.points[0][0]) * self.bounds.width, CGFloat(stroke.points[0][1]) * self.bounds.height)
                
                for point in stroke.points{
                    CGContextAddLineToPoint(context, CGFloat(point[0]) * self.bounds.width, CGFloat(point[1]) * self.bounds.height)
                }
                
                CGContextStrokePath(context)
            }
        } else {
            CGContextStrokePath(context)
        }
        

        
                
    }
    
    var stroke: Stroke {
        get{ return _stroke }
        set{
            _stroke = newValue
        }
    }
    
    var strokes: Array<Stroke>  {
        get{ return _strokes }
        set{
            _strokes = newValue
        }
    }
    
    var undoStrokes: Array<Stroke>  {
        get{ return _undoStrokes }
        set{
            _undoStrokes = newValue
        }
    }
    
    var brushChooserViewController: BrushChooserViewController {
        get{ return _brushChooserViewController! }
        set{
            _brushChooserViewController = newValue
        }
    }
}
