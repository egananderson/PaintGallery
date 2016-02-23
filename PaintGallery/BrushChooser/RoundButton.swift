//
//  RoundButton.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class RoundButton: UIControl {
    
    private var _buttonSelected: Bool = true;
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        _buttonSelected = true;
        sendActionsForControlEvents(.ValueChanged)
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContextRef? = UIGraphicsGetCurrentContext()
        
        var button : CGRect = CGRectZero
        button.size.width = bounds.width
        button.size.height = bounds.height
        button.origin.x = 0
        button.origin.y = 0
        
        if(_buttonSelected){
            CGContextSetFillColorWithColor(context, UIColor.grayColor().CGColor)
        }
        else{
            CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
        }
        
        CGContextFillRect(context, button)
        
        button.origin.y = button.origin.y + button.size.height/4;
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 25)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        let string = "round"
        string.drawWithRect(button, options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)

    }
    
    var buttonSelected: Bool {
        get{ return _buttonSelected }
        set{
            _buttonSelected = newValue
            setNeedsDisplay()
        }
    }
    
}
