//
//  PaintingCollection.swift
//  Collection View
//
//  Created by Egan Anderson on 2/20/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import Foundation

class PaintingCollection{
    
    var _paintingListViewController: PaintingListViewController?
    var _paintings: Array<Painting> = Array<Painting>()
    
    var paintingCount: Int {
        return _paintings.count
    }
    
    func painting(paintingIndex: Int) -> Painting {
        return _paintings[paintingIndex]
    }
    
    func addPainting(painting: Painting) {
        _paintings.append(painting)
    //    paintingListViewController.updateCollectionView()
    }
    
    func removePainting(paintingIndex: Int) {
        _paintings.removeAtIndex(paintingIndex)
    }
    
    func undoStroke(paintingIndex: Int){
        _paintings[paintingIndex].undoStrokes.append(_paintings[paintingIndex].strokes.removeAtIndex(_paintings[paintingIndex].strokes.count-1))
        _paintings[paintingIndex].setNeedsDisplay()
    }
    
    func redoStroke(paintingIndex: Int){
        _paintings[paintingIndex].strokes.append(_paintings[paintingIndex].undoStrokes.removeAtIndex(_paintings[paintingIndex].undoStrokes.count-1))
        _paintings[paintingIndex].setNeedsDisplay()
    }
    
    var paintingListViewController: PaintingListViewController {
        get{ return _paintingListViewController! }
        set{
            _paintingListViewController = newValue
        }
    }
}