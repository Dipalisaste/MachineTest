//
//  TableViewCell1.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import SDWebImage

protocol TableViewCell1Delegate: AnyObject{
    func cellTapped(index:String)
}

class TableViewCell1: UITableViewCell {
   
    
   
    
    

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var welcomeArr:[Welcome] = []
    var data:DataClass?
    var images:[ConfigurableOption] = []
    var attributes:[Attribute] = []
    var img:[String] = []
    var value:String?
    var img1:[String] = []
    var value1:String?
    var img2:[String] = []
    var value2:String?
    var i : Int?
    weak var delegate:TableViewCell1Delegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fetchAPI()
        
    }
    func cell2Tapped(color: Int) {
        i = color
        print("iiii\(i)")
    }
    
    
    func fetchAPI(){
        
        let str = "https://www.minisokw.com/rest/V3/inosolnapiV1/productdetails/947/0?lang=e"
        let url = URL(string: str)
        
        URLSession.shared.dataTask(with: url!) { [unowned self](data, response, error) in
            
            if error == nil {
                do{
                    self.welcomeArr = try JSONDecoder().decode([Welcome].self, from: data!)
                    self.data = self.welcomeArr[0].data
                    self.images = self.data!.configurableOption!
                    self.attributes = (self.welcomeArr[0].data?.configurableOption?[0].attributes)!
                    print("attributes\(self.attributes)")
                  
                  
                    
                        
                        self.img = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[0].images)!
                        self.value = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[0].value)!
                        print("value\(self.value)")
                        print("image\(self.img)")
                        //
                        //        self.img1 = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[1].images)!
                        //        self.value1 = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[1].value)!
                        //        print("value\(self.value1)")
                        //        print("image\(self.img1)")
                        //
                        //        self.img2 = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[2].images)!
                        //        self.value2 = (self.welcomeArr[0].data?.configurableOption?[0].attributes?[2].value)!
                        //        print("value\(self.value2)")
                        //        print("image\(self.img2)")
                        //
                        //
                        //
                        //
                    
                    DispatchQueue.main.async {
                        self.productCollectionView.reloadData()
                        //self.productImageView.sd_setImage(with: URL(string: (self.data?.image!)!), completed: nil)
                        //                        self.productName.text = self.data?.name!
                    }
                }catch(let error){
                    print(error.localizedDescription)
                }
            }
            
            
            }.resume()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCell1:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell1", for: indexPath) as! CollectionViewCell1
        
        let obj = img[indexPath.row]
        cell.productImageView.sd_setImage(with: URL(string: obj), completed: nil)
        cell.productNameLabel.text = data?.name!
        cell.productPriceLabel.text = data?.price!
//        let obj1 = img1[indexPath.row]
//        cell.productImageView.sd_setImage(with: URL(string: obj1), completed: nil)
//        cell.productNameLabel.text = data?.name!
//        cell.productPriceLabel.text = data?.price!
//        let obj2 = img2[indexPath.row]
//        cell.productImageView.sd_setImage(with: URL(string: obj2), completed: nil)
//        cell.productNameLabel.text = data?.name!
//        cell.productPriceLabel.text = data?.price!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    
        let selectedProgram = img[indexPath.row]
        delegate?.cellTapped(index: selectedProgram)

//        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
//        destinationVC.programVar = selectedProgram.data?.image
//       destinationVC.performSegue(withIdentifier: "image", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 337, height: 379)
    }
    
}

    
    
    
    
    
    

