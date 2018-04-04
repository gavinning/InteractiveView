//
//  ImageInteractive.swift
//  InteractiveView
//
//  Created by gavinning on 2018/4/4.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import UIKit

class ImageInteractive: Interactive {
    
    var marginSide: CGFloat = 10
    var margin: CGFloat {
        return marginSide*2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func createParent() -> FlexView {
        let bar = FlexView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 80))
        bar.axis = .horizontal
        bar.spacing = 6
        bar.showsHorizontalScrollIndicator = false
        bar.showsVerticalScrollIndicator = false
        bar.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.05)
        bar.contentSizeToFit()
        return bar
    }
    
    override func createItems() -> [UIView] {
        let imgs = ["1", "2", "3", "4"]
        
        return imgs.map { (image) in
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            btn.setImage(UIImage(named: image), for: .normal)
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 6
            btn.addTarget(self, action: #selector(itemClicked(_:)), for: .touchUpInside)
            btn.contentMode = .center
            return btn
        }
    }
}
