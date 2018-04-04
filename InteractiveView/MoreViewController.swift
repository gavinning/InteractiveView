//
//  MoreViewController.swift
//  InteractiveView
//
//  Created by gavinning on 2018/4/4.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tag = TagInteractive()
        tag.viewDidLoad()
        tag.inter.b.frame.origin.y = tag.inter.a.frame.origin.y + tag.inter.a.frame.height + 10
        self.view.addSubview(tag.inter.a)
        self.view.addSubview(tag.inter.b)
        
        let image = ImageInteractive()
        image.viewDidLoad()
        image.inter.b.frame.origin.y = image.inter.a.frame.origin.y + image.inter.a.frame.height + 10
        self.view.addSubview(image.inter.a)
        self.view.addSubview(image.inter.b)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
