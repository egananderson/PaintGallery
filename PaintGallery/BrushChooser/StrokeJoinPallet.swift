//
//  StrokeJoinPallet.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/8/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class StrokeJoinPallet: UIView {

    private var _miterButton: MiterButton!
    private var _roundJoinButton: RoundJoinButton!
    private var _bevelButton: BevelButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        _miterButton = MiterButton()
        addSubview(_miterButton!)
        
        _roundJoinButton = RoundJoinButton()
        addSubview(_roundJoinButton!)
        
        _bevelButton = BevelButton()
        addSubview(_bevelButton!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var availableSpace: CGRect = bounds
        (_miterButton.frame, availableSpace) = availableSpace.divide(availableSpace.width / 3, fromEdge: .MinXEdge)
        (_roundJoinButton.frame, availableSpace) = availableSpace.divide(availableSpace.width / 2, fromEdge: .MinXEdge)
        (_bevelButton.frame, availableSpace) = availableSpace.divide(availableSpace.width, fromEdge: .MinXEdge)
        
    }
    
    var miterButton : MiterButton { return _miterButton }
    
    var roundJoinButton : RoundJoinButton { return _roundJoinButton }
    
    var bevelButton : BevelButton { return _bevelButton }
}
