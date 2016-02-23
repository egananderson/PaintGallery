//
//  PaintingListViewController.swift
//  Collection View
//
//  Created by Egan Anderson on 2/20/16.
//  Copyright © 2016 Egan Anderson. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var paintingCollection: PaintingCollection?
    
    private var collectionView: UICollectionView!{
        return(view as! UICollectionView)
    }
    
    //MARK: UICollectionView Override
    override func loadView() {
        paintingCollection = PaintingCollection()
        paintingCollection?.paintingListViewController = self
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        view = UICollectionView(frame: CGRectZero, collectionViewLayout: collectionViewLayout)
        }
    
    override func viewDidLoad() {
        collectionView.registerClass(NewCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(NewCollectionViewCell.self))
        collectionView.registerClass(PaintingCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(PaintingCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    }
        
    override func viewDidAppear(animated: Bool) {
        collectionView.reloadData()
    }
    
    //MARK: Data Source Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintingCollection!.paintingCount + 1
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell?
        
        if (indexPath.item < paintingCollection!.paintingCount){
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(PaintingCollectionViewCell.self), forIndexPath: indexPath)
            let paintingCell = cell as? PaintingCollectionViewCell
            let painting: Painting = paintingCollection!.painting(indexPath.item)
            paintingCell!.setupCell(painting)
                

        } else {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(NSStringFromClass(NewCollectionViewCell.self), forIndexPath: indexPath)
            cell!.backgroundColor = UIColor.darkGrayColor()
        }
        return cell!
    }
    

    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    //MARK: Delegate Methods
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let paintingViewController: PaintingViewController = PaintingViewController()
        
        if (indexPath.item < paintingCollection!.paintingCount){
            let painting: Painting = paintingCollection!.painting(indexPath.item)
            paintingViewController.painting = painting
        } else {
            let newPainting: Painting = Painting()
            paintingViewController.painting = newPainting
            paintingCollection?.addPainting(newPainting)
        }
        paintingViewController.paintingIndex = indexPath.item
        paintingViewController.paintingCollection = paintingCollection!
        navigationController?.pushViewController(paintingViewController, animated: true)
    }
}
