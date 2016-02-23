//
//  EndCapsPallet.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/7/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class EndCapsPallet: UIView {
    
    private var _buttButtonView: UIView
    private var _roundButtonView: UIView
    private var _projectingButtonView: UIView
    
    private var _buttButton: ButtButton!
    private var _roundButton: RoundButton!
    private var _projectingButton: ProjectingButton!
    
    override init(frame: CGRect) {
        
        _buttButtonView = UIView.init()
        _roundButtonView = UIView.init()
        _projectingButtonView = UIView.init()
        
        super.init(frame: frame)
        
        _buttButton = ButtButton()
        addSubview(_buttButton!)
        
        _roundButton = RoundButton()
        addSubview(_roundButton!)
        
        _projectingButton = ProjectingButton()
        addSubview(_projectingButton!)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var availableSpace: CGRect = bounds
        (_buttButton.frame, availableSpace) = availableSpace.divide(availableSpace.width / 3, fromEdge: .MinXEdge)
        (_roundButton.frame, availableSpace) = availableSpace.divide(availableSpace.width / 2, fromEdge: .MinXEdge)
        (_projectingButton.frame, availableSpace) = availableSpace.divide(availableSpace.width, fromEdge: .MinXEdge)
        
    }
    
    var buttButton : ButtButton { return _buttButton }
    
    var roundButton : RoundButton { return _roundButton }
    
    var projectingButton : ProjectingButton { return _projectingButton }
}
