//
//  PaintingCollectionViewCell.swift
//  Collection View
//
//  Created by Egan Anderson on 2/22/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class PaintingCollectionViewCell: UICollectionViewCell {
    var paintingView: UIView?
    var painting: Painting?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        paintingView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        paintingView!.contentMode = UIViewContentMode.ScaleAspectFit
        paintingView!.backgroundColor = UIColor.grayColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(painting: Painting){
        if(contentView.subviews.count > 0){
            for (var i = 0; i < contentView.subviews.count; i++){
                contentView.subviews[i].removeFromSuperview()
            }
        }
        
        painting.frame = paintingView!.frame
        contentView.addSubview(painting)
        
        let paintingShield: UIView = UIView(frame: self.bounds)
        contentView.addSubview(paintingShield)
    }
}

