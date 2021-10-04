//
//  CircleButton.swift
//  SelfSizing
//
//  Created by 권지수 on 2021/10/04.
//

import UIKit

// 인터페이스 빌더에서 디자인으로 확인이 가능하게 만들어줌
@IBDesignable
class CircleButton: UIButton {
    // Inspector 패널에서  사용될 수 있도록  설정
    @IBInspectable var cornerRadius:CGFloat = 0 {
        // 값이 호출 되면 설정
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
