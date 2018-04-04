//
//  extensions.swift
//  iOS开发常用扩展
//
//  Created by gavinning on 2017/9/21.
//  Copyright © 2017年 gavinning. All rights reserved.
//

import UIKit

/// 同比例初始化图片
public extension UIImageView {
    
    // @name  图片资源名称 用于构建 UIImage
    // @width 图片显示宽度 高度会根据图片真实宽高比进行换算以保证图片不被拉伸
    public convenience init?(name: String, x: CGFloat = 0, y: CGFloat = 0, width: CGFloat) {
        let image = UIImage(named: name)
        // 图片构建失败时返回nil
        guard image != nil else {
            return nil
        }
        // 同比例计算图片高度
        let height = image!.size.height / image!.size.width * width
        // 构建imageView
        self.init(image: image)
        // 设置图片位置及宽高
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    public convenience init?(name: String, x: CGFloat = 0, y: CGFloat = 0, height: CGFloat) {
        let image = UIImage(named: name)
        
        guard image != nil else {
            return nil
        }
        
        let width = image!.size.width / image!.size.height * height
        
        self.init(image: image)
        self.frame = CGRect(x: x, y: y, width: width, height: height)
    }
}

public extension String {
    
    func slice(_ start: Int, _ end: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: start)
        let end = self.index(self.startIndex, offsetBy: end)
        return String(self[start..<end])
    }
    
    func slice(start: Int) -> String {
        return self.slice(start, self.count)
    }
    
    func slice(end: Int) -> String {
        return self.slice(0, end)
    }
}

public extension Array {
    // 以数组创建矩阵
    public func matrix( column: Int ) -> [[Element]] {
        var arr = self
        var matrix = [[Element]]()
        
        // 检查是否足够分组
        if arr.count > column {
            // 分割数组为矩阵
            repeat {
                matrix.append(arr.slicing(0, column))
            }
                while arr.count > column
        }
        
        // 检查数组余数
        if arr.count > 0 {
            matrix.append(arr)
        }
        return matrix
    }
    
    public func slice(_ start: Int, _ end: Int) -> [Element] {
        return Array(self[start..<end])
    }
    
    public func slice(_ start: Int, distance: Int) -> [Element] {
        return self.slice(start, self.index(start, offsetBy: distance))
    }
    
    public mutating func slicing(_ start: Int, _ end: Int) -> [Element] {
        let result = Array(self[start..<end])
        self.removeSubrange(start..<end)
        return result
    }
    
    public mutating func slicing(_ start: Int, distance: Int) -> [Element] {
        return self.slicing(start, self.index(start, offsetBy: distance))
    }
    
    public mutating func splice(_ start: Int, _ end: Int) -> [Element] {
        return self.slicing(start, end)
    }
    
    public mutating func splice(_ start: Int, distance: Int) -> [Element] {
        return self.slicing(start, distance)
    }
    
    public mutating func index<T: Equatable>(of element: T) -> Int? {
        for (index, item) in self.enumerated() {
            if let item = item as? T, item == element {
                return index
            }
        }
        return nil
    }
    
    public mutating func remove<T: Equatable>(of element: T) -> T? {
        let index = self.index(of: element)
        if let index = index {
            return self.remove(at: index) as? T
        }
        else {
            return nil
        }
    }
    
    // 简单洗牌
    public func shuffle() ->Array<Element> {
        if self.count <= 1 {
            return self
        }
        
        var ran = 0
        var arr = self
        var random = arr
        var map = Dictionary<Int,Bool>()
        // 清空
        random.removeAll()
        // 随选
        repeat {
            ran = Int(arc4random())%Int(arr.count)
            if map[ran] != true {
                random.append(arr[ran])
                arr.remove(at: ran)
            }
        }
            while arr.count > 0
        
        return random
    }
}

// 复制实例
extension UIView {
    func clone<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
}

