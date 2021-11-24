//
//  TradeItem.swift
//  Clone_Dangeun
//
//  Created by todoc on 2021/11/22.
//

import Foundation
import UIKit

/// 게시글관련 정보
/// title : 제목
/// city : 동네 위치
/// price: 가격
/// itemImage: 제품 사진
struct TradeContents {
    var title: String
    var city: String
    var price: String
    var itemImage: UIImage?
    var replyCount: Int = 0
    var chatCount: Int = 0
    var likeCount: Int = 0
}
