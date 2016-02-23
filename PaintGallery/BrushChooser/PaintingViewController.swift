//
//  PaintingViewController.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/21/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class PaintingViewController: UIViewController, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var painting: Painting?
    
    var stroke: Stroke?
    
    var currentColorView: UIView?
    var currentEndCapsLabel: UILabel?
    var currentStrokeJoinLabel: UILabel?
    var currentWidthLabel: UILabel?
    
    var _redValue: Float = 0.5
    var _greenValue: Float = 0.5
    var _blueValue: Float = 0.5
    var _strokeWidth: Float = 25.0
    
    var _paintingIndex: Int?
    var _paintingCollection: PaintingCollection?
    
    var brushChooserViewController: BrushChooserViewController?
    
    override func viewDidLoad() {
        
        self.edgesForExtendedLayout = .None
        
        brushChooserViewController = BrushChooserViewController()
        brushChooserViewController!.paintingViewController = self;
        painting!.brushChooserViewController = brushChooserViewController!
        let paintingView: PaintingView = PaintingView(frame: self.view.bounds)
        paintingView.addPainting(painting!)
        self.view.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(paintingView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change Brush", style: .Plain, target: self, action: "brushSettingsTapped")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        
        let settingsView: UIView = UIView(frame: CGRectMake(0,0,self.view.frame.size.width,65))
        settingsView.backgroundColor = UIColor.darkGrayColor()
        self.view.addSubview(settingsView)
        
        let widthLabel: UILabel = UILabel(frame: CGRectMake(90,0,100,50))
        widthLabel.text = "Width:"
        widthLabel.font = UIFont(name: "Helvetica", size: 15)
        widthLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(widthLabel)
        
        let colorLabel: UILabel = UILabel(frame: CGRectMake(90,-15,100,50))
        colorLabel.text = "Color:"
        colorLabel.font = UIFont(name: "Helvetica", size: 15)
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(colorLabel)
        
        let endCapsLabel: UILabel = UILabel(frame: CGRectMake(90,15,100,50))
        endCapsLabel.text = "End Caps:"
        endCapsLabel.font = UIFont(name: "Helvetica", size: 15)
        endCapsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(endCapsLabel)
        
        let strokeJoinLabel: UILabel = UILabel(frame: CGRectMake(90,30,100,50))
        strokeJoinLabel.text = "Stroke Join:"
        strokeJoinLabel.font = UIFont(name: "Helvetica", size: 15)
        strokeJoinLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(strokeJoinLabel)
        
        currentColorView = UIView(frame: CGRectMake(190,2,15,15))
        currentColorView?.backgroundColor = UIColor(red: CGFloat(painting!.stroke.redValue), green: CGFloat(painting!.stroke.redValue), blue: CGFloat(painting!.stroke.redValue), alpha: 1)
        strokeJoinLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(currentColorView!)
        
        currentWidthLabel = UILabel(frame: CGRectMake(190,0,100,50))
        currentWidthLabel!.text = String(painting!.stroke.width)
        currentWidthLabel!.font = UIFont(name: "Helvetica", size: 15)
        currentWidthLabel!.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(currentWidthLabel!)
        
        currentEndCapsLabel = UILabel(frame: CGRectMake(190,15,100,50))
        currentEndCapsLabel!.font = UIFont(name: "Helvetica", size: 15)
        currentEndCapsLabel!.text = "Round"
        currentEndCapsLabel!.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(currentEndCapsLabel!)
        
        currentStrokeJoinLabel = UILabel(frame: CGRectMake(190,30,100,50))
        currentStrokeJoinLabel!.font = UIFont(name: "Helvetica", size: 15)
        currentStrokeJoinLabel!.text = "Round"
        currentStrokeJoinLabel!.translatesAutoresizingMaskIntoConstraints = false
        settingsView.addSubview(currentStrokeJoinLabel!)
        
        let deleteButton = UIButton(frame: CGRectMake(10, self.view.frame.height*4/5, 90, 25))
        deleteButton.backgroundColor = UIColor.darkGrayColor()
        deleteButton.titleLabel!.font = UIFont(name: "Helvetica", size: 15)
        deleteButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        deleteButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Selected)
        deleteButton.setTitle("Delete", forState: UIControlState.Normal)
        deleteButton.addTarget(self, action: "deletePainting", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(deleteButton)
        
//        let undoButton = UIButton(frame: CGRectMake(110, self.view.frame.height*4/5, 90, 25))
//        undoButton.backgroundColor = UIColor.darkGrayColor()
//        undoButton.titleLabel!.font = UIFont(name: "Helvetica", size: 15)
//        undoButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        undoButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Selected)
//        undoButton.setTitle("Undo", forState: UIControlState.Normal)
//        undoButton.addTarget(self, action: "undoStroke", forControlEvents: UIControlEvents.TouchUpInside)
//        view.addSubview(undoButton)
//        
//        let redoButton = UIButton(frame: CGRectMake(210, self.view.frame.height*4/5, 90, 25))
//        redoButton.backgroundColor = UIColor.darkGrayColor()
//        redoButton.titleLabel!.font = UIFont(name: "Helvetica", size: 15)
//        redoButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//        redoButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Selected)
//        redoButton.setTitle("Redo", forState: UIControlState.Normal)
//        redoButton.addTarget(self, action: "redoStroke", forControlEvents: UIControlEvents.TouchUpInside)
//        view.addSubview(redoButton)

    }
    
    func deletePainting(){
        _paintingCollection?.removePainting(_paintingIndex!)
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func undoStroke(){
        if(_paintingCollection?.painting(_paintingIndex!).strokes.count > 0){
            _paintingCollection?.undoStroke(_paintingIndex!)
        }
    }
    
    func redoStroke(){
        if(_paintingCollection?.painting(_paintingIndex!).undoStrokes.count > 0){
            _paintingCollection?.redoStroke(_paintingIndex!)
        }

       
    }
    
    func rotated()
    {
        painting!.bounds = self.view.bounds
        painting!.setNeedsDisplay()
    }
    
    func brushSettingsTapped(){
        brushChooserViewController!.painting = painting
//        navigationController?.presentViewController(brushChooserViewController, animated: true, completion: nil)
        navigationController?.pushViewController(brushChooserViewController!, animated: true)
    }
    
    func endCap(type: Int){
        var endCapString: String?
        if (type == 0){
            endCapString = "Butt"
        } else if (type == 1){
            endCapString = "Round"
        } else {
            endCapString = "Square"
        }
        currentEndCapsLabel!.text = endCapString
    }
    
    func strokeEnd(type: Int){
        var strokeJoinString: String?
        if (type == 0){
            strokeJoinString = "Miter"
        } else if (type == 1){
            strokeJoinString = "Round"
        } else {
            strokeJoinString = "Bevel"
        }
        currentStrokeJoinLabel!.text = strokeJoinString
    }
    
    var redValue: Float {
        get{ return _redValue }
        set{
            _redValue = newValue
            currentColorView?.backgroundColor = UIColor(red: CGFloat(_redValue), green: CGFloat(_greenValue), blue: CGFloat(_blueValue), alpha: 1)
        }
    }
    
    var greenValue: Float {
        get{ return _greenValue }
        set{
            _greenValue = newValue
            currentColorView?.backgroundColor = UIColor(red: CGFloat(_redValue), green: CGFloat(_greenValue), blue: CGFloat(_blueValue), alpha: 1)
        }
    }
    
    var blueValue: Float {
        get{ return _blueValue }
        set{
            _blueValue = newValue
            currentColorView?.backgroundColor = UIColor(red: CGFloat(_redValue), green: CGFloat(_greenValue), blue: CGFloat(_blueValue), alpha: 1)
        }
    }
    
    var strokeWidth: Float {
        get{ return _strokeWidth }
        set{
            _strokeWidth = newValue
            currentWidthLabel!.text = String(_strokeWidth)
        }
    }
    
    var paintingIndex: Int {
        get{ return _paintingIndex! }
        set{
            _paintingIndex = newValue
        }
    }

    var paintingCollection: PaintingCollection {
        get{ return _paintingCollection! }
        set{
            _paintingCollection = newValue
        }
    }
    
}
