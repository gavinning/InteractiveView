//
//  InteractiveDelegate.swift
//  InteractiveView
//
//  Created by gavinning on 2018/4/3.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import UIKit

@objc protocol InteractiveDelegate {
    
    // 创建子视图 必须
    func createItems() -> [UIView]
    // 创建父视图 必须
    func createParent() -> FlexView
    
    // 子视图进出场前后 可选
    @objc optional func interactive(inter: FlexView, willClick item: UIView)
    @objc optional func interactive(inter: FlexView, didClicked item: UIView)
    
}
