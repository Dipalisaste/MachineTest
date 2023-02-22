//
//  ViewController.swift
//  DemoProductMachineTest
//
//  Created by Felix-ITS015 on 01/12/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell1
            cell1.delegate = self
            
    
        return cell1
        }else if indexPath.row == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableViewCell2
            cell2.delegate2 = self
            
            return cell2
        }else if indexPath.row == 2{
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3") as! TableViewCell3

            return cell3
        }else if indexPath.row == 3{
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "cell4") as! TableViewCell4
            
            return cell4
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
        return 400.0
        }else if indexPath.row == 1{
            return 80.0
        }else if indexPath.row == 2{
            return 100.0
        }else if indexPath.row == 3{
            return 100.0
        }
        return 0.0
    }
}
extension ViewController: TableViewCell1Delegate,TableViewCell2Delegate {
    func cell2Tapped(color: String) {
         print("\(color):color")
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "ColorImageViewController") as! ColorImageViewController
        vc1.color1 = color
        navigationController?.pushViewController(vc1, animated: true)
    }
    
    
    
    func cellTapped(index: String) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        vc.programVar = index
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

    
    

