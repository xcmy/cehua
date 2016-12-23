//
//  ViewController.swift
//  cehua
//
//  Created by 刘洋 on 2016/12/9.
//  Copyright © 2016年 jdzw. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {

    var scrollview = UIScrollView()
    var tableView = UITableView()
    var nav:UINavigationController?
    
    
    var startContentOffsetX:CGFloat?
    var willEndContentOffsetX:CGFloat?
    var endContentOffsetX:CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x:0,y:0,width:JDWIDTH+200,height:JDHEIGHT)
        
        scrollview.frame = CGRect(x:0,y:0,width:JDWIDTH,height:JDHEIGHT)
        scrollview.backgroundColor = UIColor.red
        scrollview.delegate = self
        scrollview.bounces = false
        scrollview.contentSize =  CGSize(width:JDWIDTH+201,height:JDHEIGHT)
        self.view.addSubview(scrollview)
        
        
        tableView.frame = JDRECT(xx: 0, yy: 0, w: 200, h: JDHEIGHT)
        tableView.delegate = self
        tableView.dataSource  = self
        tableView.backgroundColor = UIColor.gray
        tableView.rowHeight = 50
        
        scrollview.addSubview(tableView)
        
        
        
        nav = UINavigationController(rootViewController:secViewController())
        self.addChildViewController(nav!)
        nav!.view.frame = CGRect(x:200,y:0,width:JDWIDTH,height:JDHEIGHT)
        nav!.view.backgroundColor = UIColor.yellow
        scrollview.addSubview(nav!.view)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startContentOffsetX = scrollView.contentOffset.x
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        willEndContentOffsetX = scrollView.contentOffset.x
        
        print("\(willEndContentOffsetX)====\(startContentOffsetX)")
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if Int(willEndContentOffsetX!) < Int(startContentOffsetX!) {
            UIView.animate(withDuration: 0.1, animations: {
                scrollView.contentOffset = CGPoint(x:0 ,y:0)
                
            })
            
        }else if Int(willEndContentOffsetX!) > Int(startContentOffsetX!)
        {
            UIView.animate(withDuration: 0.1, animations: {
                scrollView.contentOffset = CGPoint(x:200 ,y:0)
            })
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        
        if scrollView.responds(to: #selector(scrollViewDidEndDragging(_:willDecelerate:))) {
            
        }else
        {
            if Int(willEndContentOffsetX!) < Int(startContentOffsetX!) {
                scrollView.contentOffset = CGPoint(x:0 ,y:0)
            }else if Int(willEndContentOffsetX!) > Int(startContentOffsetX!)
            {
                scrollView.contentOffset = CGPoint(x:200 ,y:0)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "点击了第\(indexPath.row)行"
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor .green
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nav?.pushViewController(thirdViewController(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

