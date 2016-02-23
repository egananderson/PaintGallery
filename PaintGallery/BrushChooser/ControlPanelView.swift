//
//  ControlPanelView.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/3/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class ControPanelView: UIView {
    
    private var _redPallet: RedPallet!
    private var _greenPallet: GreenPallet!
    private var _bluePallet: BluePallet!
    private var _widthPallet: WidthPallet!
    private var _endCapsPallet: EndCapsPallet!
    private var _strokeJoinPallet: StrokeJoinPallet!
    private var _preview: Preview!
    
  //  private var _endCapsPallet: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        _redPallet = RedPallet()
        _redPallet?.backgroundColor = UIColor.whiteColor()
        _redPallet?.xRatio = 0.5
        addSubview(_redPallet!)
        
        _greenPallet = GreenPallet()
        _greenPallet?.xRatio = 0.5
        addSubview(_greenPallet!)
        
        _bluePallet = BluePallet()
        _bluePallet?.xRatio = 0.5
        addSubview(_bluePallet!)
        
        _widthPallet = WidthPallet()
        _widthPallet?.xRatio = 0.5
        addSubview(_widthPallet!)

        _endCapsPallet = EndCapsPallet()
        addSubview(_endCapsPallet!)
        
        _strokeJoinPallet = StrokeJoinPallet()
        addSubview(_strokeJoinPallet!)
        
        _preview = Preview()
        _preview?.backgroundColor = UIColor.blackColor()
        addSubview(_preview!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var availableSpace: CGRect = bounds
        
        (_preview.frame, availableSpace) = availableSpace.divide(availableSpace.height / 4, fromEdge: .MinYEdge)
        (_endCapsPallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 6, fromEdge: .MinYEdge)
        (_strokeJoinPallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 5, fromEdge: .MinYEdge)
        (_redPallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 4, fromEdge: .MinYEdge)
        (_greenPallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 3, fromEdge: .MinYEdge)
        (_bluePallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 2, fromEdge: .MinYEdge)
        (_widthPallet.frame, availableSpace) = availableSpace.divide(availableSpace.height / 1, fromEdge: .MinYEdge)
       
        
        

    }
    
    var redPallet: RedPallet { return _redPallet! }
    var greenPallet: GreenPallet { return _greenPallet! }
    var bluePallet: BluePallet { return _bluePallet! }
    var widthPallet: WidthPallet { return _widthPallet }
    var preview: Preview { return _preview }
    var endCapsPallet: EndCapsPallet { return _endCapsPallet }
    var strokeJoinPallet: StrokeJoinPallet {return _strokeJoinPallet }
}
