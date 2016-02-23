//
//  NewCollectionViewCell.swift
//  Collection View
//
//  Created by Egan Anderson on 2/22/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleLabel: UILabel = UILabel()
        titleLabel.font = UIFont(name: "Helvetica", size: 30)
        titleLabel.text = "+"
        titleLabel.textAlignment = .Center
        titleLabel.frame = CGRectMake(0, 0, 50, 45)
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}