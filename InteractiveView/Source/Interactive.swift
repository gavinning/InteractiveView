//
//  Interactive.swift
//  Interactive
//
//  Created by gavinning on 2018/4/3.
//  Copyright © 2018年 gavinning. All rights reserved.
//

import UIKit


public class Interactive: UIViewController, InteractiveDelegate {
    var delegate: InteractiveDelegate?
    // 关联FlexView
    public var inter: (a: FlexView, b: FlexView)!
    // 关联FlexView对应的子视图
    private var items: (a: [UIView], b: [UIView])!
    

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.interAssociate()
    }
    
    // 创建关联
    private func interAssociate() {
        // 创建关联对象容器
        inter = (delegate?.createParent(), delegate?.createParent()) as! (a: FlexView, b: FlexView)
        // 创建关联对象子视图数据模型
        items = (delegate?.createItems(), delegate?.createItems()) as! (a: [UIView], b: [UIView])
        
        // 开启回弹
        switch inter.a.axis {
        case .vertical: inter.a.alwaysBounceVertical = true
        case .horizontal: inter.a.alwaysBounceHorizontal = true
        }
        // 开启回弹
        switch inter.b.axis {
        case .vertical: inter.b.alwaysBounceVertical = true
        case .horizontal: inter.b.alwaysBounceHorizontal = true
        }
        
        // 默认满载inter.b
        items.b.forEach { (item) in
            inter.b.addSubview(item)
        }
        // 更新inter.b.contentSize
        inter.b.contentSizeToFit()
    }
    
    // 创建子视图代理方法 必须实现
    public func createItems() -> [UIView] {
        return [UIView()]
    }
    
    // 创建关联容器代理方法 必须实现
    public func createParent() -> FlexView {
        return FlexView()
    }
    
    @objc public func itemClicked(_ sender: UIButton) {
        // 检查容器是否是FlexView
        if let superview = sender.superview as? FlexView {
            delegate?.interactive?(inter: superview, willClick: sender)

            superview.removeSubview(sender, animated: true)
            superview.contentSizeToFit(animated: true)

            // a.clicked
            if let index = items.a.index(of: sender as UIView) {
                // item被删除后无法被再次添加
                // 所以这里生成新的item组，取出对应的item
                let item =  delegate?.createItems()[index]
                // 更新到数据模型
                // 当item被删除时 从该数组查询被删除的item的索引
                items.b[index] = item!
                // 添加到关联视图
                inter.b.addSubview(item!, animated: true)
                inter.b.contentSizeToFit(animated: true)
            }
            // b.clicked
            // 注释详情同上
            if let index = items.b.index(of: sender as UIView) {
                let item =  delegate?.createItems()[index]
                items.a[index] = item!
                inter.a.addSubview(item!, animated: true)
                inter.a.contentSizeToFit(animated: true)
            }
            
            delegate?.interactive?(inter: superview, didClicked: sender)
        }
    }
}
