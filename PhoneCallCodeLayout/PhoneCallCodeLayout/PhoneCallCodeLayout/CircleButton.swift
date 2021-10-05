//
//  CircleButton.swift
//  PhoneCallCodeLayout
//
//  Created by 권지수 on 2021/10/04.
//

import Foundation
import UIKit
class CircleButton: UIButton {
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
