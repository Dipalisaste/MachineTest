//
//  TableViewCell2.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit

protocol TableViewCell2Delegate: AnyObject{
    func cell2Tapped(color:String)
}

class TableViewCell2: UITableViewCell {
   
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    @IBOutlet weak var colorLabel: UILabel!
    
    let colorArr:[UIColor] = [#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    weak var delegate2:TableViewCell2Delegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TableViewCell2:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "colorcollectioncell", for: indexPath) as! CollectionViewCell2
    cell.colorView.backgroundColor = colorArr[indexPath.row]
        cell.colorView.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            colorLabel.text = "Grey"
            delegate2?.cell2Tapped(color: colorLabel.text!)
            
        }else if indexPath.row == 1{
            colorLabel.text = "Gold"
            delegate2?.cell2Tapped(color: colorLabel.text!)
        }else if indexPath.row == 2{
            colorLabel.text = "White"
            delegate2?.cell2Tapped(color: colorLabel.text!)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
