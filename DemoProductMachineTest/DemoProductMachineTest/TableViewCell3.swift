//
//  TableViewCell3.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import SDWebImage



class TableViewCell3: UITableViewCell {
    
    var welcomeArr1:[Welcome] = []
    var data1:DataClass?
    var images:[String] = []
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fetchAPI()
    }
    func fetchAPI(){
        
        let str = "https://www.minisokw.com/rest/V3/inosolnapiV1/productdetails/947/0?lang=e"
        let url = URL(string: str)
        
        URLSession.shared.dataTask(with: url!) { [unowned self](data, response, error) in
            
            if error == nil {
                do{
                    self.welcomeArr1 = try JSONDecoder().decode([Welcome].self, from: data!)
                    self.data1 = self.welcomeArr1[0].data
                    self.images = self.data1!.images!
                    DispatchQueue.main.async {
                        
                        //self.productImageView.sd_setImage(with: URL(string: (self.data?.image!)!), completed: nil)
                self.nameLabel.text = "SKU:\(self.data1!.name!)"
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
