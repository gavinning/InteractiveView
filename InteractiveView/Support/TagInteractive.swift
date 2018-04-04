//
//  TagInteractive.swift
//  InteractiveView
//
//  Created by gavinning on 2018/4/4.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import UIKit

class TagInteractive: Interactive {
    
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
        let bar = FlexView(frame: CGRect(x: 0, y: 30, width: self.view.frame.width, height: 40))
        bar.axis = .horizontal
        bar.spacing = 6
        bar.showsHorizontalScrollIndicator = false
        bar.showsVerticalScrollIndicator = false
        bar.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        bar.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.05)
        bar.contentSizeToFit()
        return bar
    }
    
    override func createItems() -> [UIView] {
        let tags = ["风光", "色彩", "城市", "时尚", "旅行", "上海", "雕刻时光", "手绘", "插画"] // , "CG", "原画", "35mm", "尼康"
        
        return tags.map { (tag) in
            let btn = UIButton()
            btn.setTitle(tag, for: .normal)
            btn.setTitleColor(.gray, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 10
            btn.layer.borderColor = UIColor.gray.cgColor
            btn.layer.borderWidth = 0.5
            btn.contentEdgeInsets = UIEdgeInsets(top: 4, left: self.marginSide, bottom: 4, right: self.marginSide)
            btn.sizeToFit()
            btn.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.05)
            btn.addTarget(self, action: #selector(itemClicked(_:)), for: .touchUpInside)
            return btn
        }
    }
}

