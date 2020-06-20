//
//  TaskDemoController.swift
//  ZippSlipShadow
//
//  Created by Amar Kumar on 07/04/20.
//  Copyright © 2020 Amar Kumar. All rights reserved.
//

import UIKit

class TaskDemoController: UIViewController {

    @IBOutlet weak var collectionGridView: UICollectionView!
    var isLogin : Bool = false
    let dataSource = ["Item 1 Tab 1","Item 2 Tab 1","Item 3 Tab 1","Item 4 Tab 1","Item 5 Tab 1","Item 6 Tab 1","Item 7 Tab 1","Item 8 Tab 1","Item 9 Tab 10","Item 11 Tab 1","Item 12 Tab 13","Item 14 Tab 1"]
    var estimatedWidth = 160
    var cellMarginSize = 15

    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the vie
        self.collectionGridView.delegate = self as? UICollectionViewDelegate
        self.collectionGridView.dataSource = self as? UICollectionViewDataSource
        self.collectionGridView.register(UINib(nibName: Constants.CUSTOM_CELL, bundle: nil), forCellWithReuseIdentifier: Constants.RESUABLE_COLLECTION_CELL)
        self.setupGridView()
     }


    @IBAction func ButtonMidClicked(_ sender: UIButton) {
        sender.removeFromSuperview()
    }
    func setupGridView() {
        let flow = collectionGridView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
    }
}

extension TaskDemoController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.RESUABLE_COLLECTION_CELL, for: indexPath) as! CustomCellCollectionViewCell
        cell.setData(data: dataSource[indexPath.row])
        return cell
    }
}
extension TaskDemoController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat {
        
        let estimateWidth = CGFloat(estimatedWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width)/estimateWidth)
        let margin = CGFloat(cellMarginSize * 2 )
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1 ) - margin)/cellCount
        return width
    }
    
}

