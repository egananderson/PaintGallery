//
//  WidthPallet.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/7/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class WidthPallet: UIControl {
    
    private var _xRatio: CGFloat = 0.5;
    private var _palletRect: CGRect = CGRectZero
    private var _selectorRect: CGRect = CGRectZero
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        xRatio = (touchPoint.x  - _selectorRect.width / 2) / (bounds.width - _selectorRect.width)
        sendActionsForControlEvents(.ValueChanged)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        xRatio = (touchPoint.x  - _selectorRect.width / 2) / (bounds.width - _selectorRect.width)
        sendActionsForControlEvents(.ValueChanged)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        xRatio = (touchPoint.x  - _selectorRect.width / 2) / (bounds.width - _selectorRect.width)
        sendActionsForControlEvents(.ValueChanged)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
        
        _palletRect.size.width = bounds.width
        _palletRect.size.height = bounds.height
        _palletRect.origin.x = 0
        _palletRect.origin.y = (bounds.height - _palletRect.size.height) / 2
        
        var widthPreviewRect: CGRect = CGRectZero
        widthPreviewRect.size.width = bounds.width
        widthPreviewRect.origin.x = 0
        
        _selectorRect.size.width = _palletRect.height
        _selectorRect.size.height = _selectorRect.size.width
        _selectorRect.origin.y = _palletRect.origin.y + _palletRect.height / 2 - _selectorRect.height / 2
        if(_xRatio <= 0.0){
            _selectorRect.origin.x = 0.0
            widthPreviewRect.size.height = _palletRect.size.height * 0.03
        } else if(_xRatio >= 1.0){
            _selectorRect.origin.x = _palletRect.width - _selectorRect.size.width
            widthPreviewRect.size.height = 0.97 * _palletRect.size.height + _palletRect.size.height * 0.03
        } else {
            _selectorRect.origin.x =  _xRatio * (_palletRect.width - _selectorRect.size.width)
            widthPreviewRect.size.height = _xRatio * 0.97 * _palletRect.size.height + _palletRect.size.height * 0.03
        }
        
        widthPreviewRect.origin.y = (bounds.height - widthPreviewRect.size.height) / 2
        
        CGContextSetFillColorWithColor(context, UIColor.grayColor().CGColor)
        CGContextFillRect(context, _palletRect)
        
        CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
        CGContextFillRect(context, widthPreviewRect)
        
        CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
        CGContextFillRect(context, _selectorRect)
        
        _selectorRect.origin.y = _selectorRect.origin.y + _selectorRect.size.height/4;
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 25)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        let string = "width"
        string.drawWithRect(_selectorRect, options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)
        
        
    }
    
    
    
    var xRatio: CGFloat {
        get{ return _xRatio }
        set{
            _xRatio = newValue
            setNeedsDisplay()
        }
    }
}
