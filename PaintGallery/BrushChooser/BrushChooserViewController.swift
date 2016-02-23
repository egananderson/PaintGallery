//
//  BrushChooserViewController.swift
//  BrushChooser
//
//  Created by Egan Anderson on 2/21/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class BrushChooserViewController: UIViewController, UIApplicationDelegate {
    
    var controlPanelView: ControPanelView?
    var painting: Painting?
    var _paintingViewController: PaintingViewController?
    
    override func viewDidLoad() {
        
        self.edgesForExtendedLayout = .None
        
        controlPanelView = ControPanelView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height - (navigationController?.navigationBar.frame.size.height)! - 18))
        controlPanelView!.redPallet.addTarget(self, action: "redValueChanged", forControlEvents: .ValueChanged)
        controlPanelView!.greenPallet.addTarget(self, action: "greenValueChanged", forControlEvents: .ValueChanged)
        controlPanelView!.bluePallet.addTarget(self, action: "blueValueChanged", forControlEvents: .ValueChanged)
        controlPanelView!.widthPallet.addTarget(self, action: "widthChanged", forControlEvents: .ValueChanged)
        
        controlPanelView!.endCapsPallet.buttButton.addTarget(self, action: "buttButtonPressed", forControlEvents: .ValueChanged)
        controlPanelView!.endCapsPallet.roundButton.addTarget(self, action: "roundButtonPressed", forControlEvents: .ValueChanged)
        controlPanelView!.endCapsPallet.projectingButton.addTarget(self, action: "projectingButtonPressed", forControlEvents: .ValueChanged)
        
        controlPanelView!.strokeJoinPallet.miterButton.addTarget(self, action: "miterButtonPressed", forControlEvents: .ValueChanged)
        controlPanelView!.strokeJoinPallet.roundJoinButton.addTarget(self, action: "roundJoinButtonPressed", forControlEvents: .ValueChanged)
        controlPanelView!.strokeJoinPallet.bevelButton.addTarget(self, action: "bevelButtonPressed", forControlEvents: .ValueChanged)
        
        self.view.addSubview(controlPanelView!)
        
    }
    
    func doneButtonPressed(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    func redValueChanged (){
        controlPanelView!.preview.redValue = Float(controlPanelView!.redPallet.xRatio)
        painting!.stroke.redValue = Float(controlPanelView!.redPallet.xRatio)
        _paintingViewController?.redValue = Float(controlPanelView!.redPallet.xRatio)
    }
    
    func greenValueChanged (){
        controlPanelView!.preview.greenValue = Float(controlPanelView!.greenPallet.xRatio)
        painting!.stroke.greenValue = Float(controlPanelView!.greenPallet.xRatio)
        _paintingViewController?.greenValue = Float(controlPanelView!.greenPallet.xRatio)
    }
    
    func blueValueChanged (){
        controlPanelView!.preview.blueValue = Float(controlPanelView!.bluePallet.xRatio)
        painting!.stroke.blueValue = Float(controlPanelView!.bluePallet.xRatio)
        _paintingViewController?.blueValue = Float(controlPanelView!.bluePallet.xRatio)
    }
    
    func widthChanged (){
        if(controlPanelView!.widthPallet.xRatio <= 0.0){
            controlPanelView!.preview.width = 0.5
            painting!.stroke.width = 0.5
            _paintingViewController!.strokeWidth = 0.5
        } else if(controlPanelView!.widthPallet.xRatio >= 1.0){
            controlPanelView!.preview.width = 50
            painting!.stroke.width = 50
            _paintingViewController!.strokeWidth = 50
        } else {
            controlPanelView!.preview.width = Float(controlPanelView!.widthPallet.xRatio * 49.5 + 0.5)
            painting!.stroke.width = Float(controlPanelView!.widthPallet.xRatio * 49.5 + 0.5)
            _paintingViewController!.strokeWidth = Float(controlPanelView!.widthPallet.xRatio * 49.5 + 0.5)
        }
        
    }
    
    func buttButtonPressed(){
        controlPanelView!.endCapsPallet.buttButton.buttonSelected = true;
        controlPanelView!.endCapsPallet.roundButton.buttonSelected = false;
        controlPanelView!.endCapsPallet.projectingButton.buttonSelected = false;
        controlPanelView!.preview.endCapType = 0
        painting!.stroke.endCapType = 0
        _paintingViewController?.endCap(0)
    }
    
    func roundButtonPressed(){
        controlPanelView!.endCapsPallet.roundButton.buttonSelected = true;
        controlPanelView!.endCapsPallet.buttButton.buttonSelected = false;
        controlPanelView!.endCapsPallet.projectingButton.buttonSelected = false;
        controlPanelView!.preview.endCapType = 1
        painting!.stroke.endCapType = 1
        _paintingViewController?.endCap(1)
    }
    
    func projectingButtonPressed(){
        controlPanelView!.endCapsPallet.projectingButton.buttonSelected = true;
        controlPanelView!.endCapsPallet.buttButton.buttonSelected = false;
        controlPanelView!.endCapsPallet.roundButton.buttonSelected = false;
        controlPanelView!.preview.endCapType = 2
        painting!.stroke.endCapType = 2
        _paintingViewController?.endCap(2)
    }
    
    func miterButtonPressed(){
        controlPanelView!.strokeJoinPallet.miterButton.buttonSelected = true;
        controlPanelView!.strokeJoinPallet.roundJoinButton.buttonSelected = false;
        controlPanelView!.strokeJoinPallet.bevelButton.buttonSelected = false;
        controlPanelView!.preview.strokeJoinType = 0
        painting!.stroke.strokeJoinType = 0
        _paintingViewController?.strokeEnd(0)
    }
    
    func roundJoinButtonPressed(){
        controlPanelView!.strokeJoinPallet.roundJoinButton.buttonSelected = true;
        controlPanelView!.strokeJoinPallet.miterButton.buttonSelected = false;
        controlPanelView!.strokeJoinPallet.bevelButton.buttonSelected = false;
        controlPanelView!.preview.strokeJoinType = 1
        painting!.stroke.strokeJoinType = 1
        _paintingViewController?.strokeEnd(1)
    }
    
    func bevelButtonPressed(){
        controlPanelView!.strokeJoinPallet.bevelButton.buttonSelected = true;
        controlPanelView!.strokeJoinPallet.roundJoinButton.buttonSelected = false;
        controlPanelView!.strokeJoinPallet.miterButton.buttonSelected = false;
        controlPanelView!.preview.strokeJoinType = 2
        painting!.stroke.strokeJoinType = 2
        _paintingViewController?.strokeEnd(2)
    }
    
    var paintingViewController: PaintingViewController {
        get{ return _paintingViewController! }
        set{
            _paintingViewController = newValue
        }
    }

}
