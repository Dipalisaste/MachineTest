//
//  TableViewCell4.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit

class TableViewCell4: UITableViewCell {
    var welcomeArr2:[Welcome] = []
    var data2:DataClass?
    var images:[String] = []
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
                    self.welcomeArr2 = try JSONDecoder().decode([Welcome].self, from: data!)
                    self.data2 = self.welcomeArr2[0].data
                    self.images = self.data2!.images!
                    DispatchQueue.main.async {
                        
                        //self.productImageView.sd_setImage(with: URL(string: (self.data?.image!)!), completed: nil)
                        self.descriptionLabel.text = self.data2?.description!
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
