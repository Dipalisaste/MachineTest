//
//  ColorImageViewController.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 02/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import SDWebImage
class ColorImageViewController: UIViewController {

    var welcomeArr:[Welcome] = []
    var data:DataClass?
    var images:[ConfigurableOption] = []
    var attributes:[Attribute] = []
    var imgArr:[String] = []
    var imgArr1:[String] = []
    var imgArr2:[String] = []
    var color1:String?
    var val:String?
    var val1:String?
    var val2:String?
    @IBOutlet weak var colorCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchAPI()
        // Do any additional setup after loading the view.
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
                   
                    self.imgArr = (self.welcomeArr[0].data?.configurableOption![0].attributes![0].images!)!
                    self.imgArr1 = (self.welcomeArr[0].data?.configurableOption![0].attributes![1].images!)!
                    self.imgArr2 = (self.welcomeArr[0].data?.configurableOption![0].attributes![2].images!)!
                    self.val = (self.welcomeArr[0].data?.configurableOption![0].attributes![0].value)!
                    self.val1 = (self.welcomeArr[0].data?.configurableOption![0].attributes![1].value)!
                    self.val2 = (self.welcomeArr[0].data?.configurableOption![0].attributes![2].value)!
                    DispatchQueue.main.async {
                        
                        self.colorCollectionView.reloadData()
                        //self.productImageView.sd_setImage(with: URL(string: (self.data?.image!)!), completed: nil)
                        //                        self.productName.text = self.data?.name!
                    }
                }catch(let error){
                    print(error.localizedDescription)
                }
            }
            
            
            }.resume()
        
    }


    

}
extension ColorImageViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
       
        if val == color1{
            print("count:\(imgArr.count)")
            print("****\(val)")
            return imgArr.count
        }else if val1 == color1{
            print("count:\(imgArr1.count)")
            print("****1\(val1)")
            return imgArr1.count
    }else if val2 == color1{
            print("count:\(imgArr2.count)")
            print("****1\(val2)")
            return imgArr2.count
    }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "colorcell", for: indexPath) as! ColorCollectionViewCell
        if val == color1{
            let obj = imgArr[indexPath.row]
            cell.colorimgView.sd_setImage(with: URL(string: obj), completed: nil)
            return cell
        }else if val1 == color1{
            let obj1 = imgArr1[indexPath.row]
            cell.colorimgView.sd_setImage(with: URL(string: obj1), completed: nil)
            return cell
        }else if val2 == color1{
            let obj2 = imgArr2[indexPath.row]
            cell.colorimgView.sd_setImage(with: URL(string: obj2), completed: nil)
            return cell
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        vc.programVar = imgArr[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
