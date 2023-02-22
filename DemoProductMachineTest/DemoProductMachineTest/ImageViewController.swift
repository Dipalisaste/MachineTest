//
//  ImageViewController.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit
import SDWebImage
class ImageViewController: UIViewController {
    
    var programVar:String?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = 6
        scrollView.maximumZoomScale = 10
        // Do any additional setup after loading the view.
//        detailImageView.sd_setImage(with: URL(string: (programVar!.data?.image)!), completed: nil)
       scrollView.delegate = self
        
        let url = URL(string:(programVar)!)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            detailImageView.image = UIImage(data: data!)
        }
            
        
    }


   
}

extension ImageViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return detailImageView!
    }
    
}
