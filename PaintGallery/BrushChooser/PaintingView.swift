//
//  PaintingView.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/21/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class PaintingView: UIView {
    
    private var _painting: Painting?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _painting?.backgroundColor = UIColor.blackColor()
        
    }
    
    func addPainting(painting: Painting) {
        _painting = painting
        _painting!.stroke.redValue = 0.5
        _painting!.stroke.greenValue = 0.5
        _painting!.stroke.blueValue = 0.5
        _painting!.stroke.width = 25
        _painting!.stroke.endCapType = 1
        _painting!.stroke.strokeJoinType = 1
        addSubview(_painting!)
    }
    
    override func layoutSubviews() {
        _painting?.frame = self.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var painting: Painting {
        get{ return _painting! }
    }
}