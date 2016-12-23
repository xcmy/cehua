//
//  secViewController.swift
//  cehua
//
//  Created by 刘洋 on 2016/12/9.
//  Copyright © 2016年 jdzw. All rights reserved.
//

import UIKit

class secViewController: UIViewController,UIScrollViewDelegate{

    var scrollview = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollview.frame = CGRect(x:0,y:0,width:400,height:JDHEIGHT+200)
        scrollview.backgroundColor = UIColor.red
        scrollview.delegate = self
        scrollview.bounces = false
        //        scrollview.isPagingEnabled = true
        scrollview.contentSize =  CGSize(width:400,height:JDHEIGHT+200)
        self.view.addSubview(scrollview)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
