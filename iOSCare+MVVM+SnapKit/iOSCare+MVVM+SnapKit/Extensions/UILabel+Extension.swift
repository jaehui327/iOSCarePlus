//
//  UILabel+Extension.swift
//  iOSCare+MVVM+SnapKit
//
//  Created by 김재희 on 2021/02/20.
//

import UIKit

extension UILabel {
    convenience init(size: CGFloat, weight: UIFont.Weight, textColor: UIColor, textAlignment: NSTextAlignment = .left, text: String = "") {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.text = text
    }

    convenience init(fontName: String, size: CGFloat, textColor: UIColor, textAlignment: NSTextAlignment = .left, text: String = "") {
        self.init(frame: .zero)
        self.font = UIFont(name: fontName, size: size)
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.text = text
    }
}
