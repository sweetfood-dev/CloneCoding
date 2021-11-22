//
//  ContentDataSource.swift
//  Clone_Dangeun
//
//  Created by todoc on 2021/11/22.
//

import UIKit

class ContentsDataSource: NSObject, UITableViewDataSource {
    // tableView에 표시될 아이템들, 삭제, 추가등이 될 수 있기에 var로 선언
    lazy var tradeItems: [TradeContents]  = {
        return loadItems()
    }()
    
    private func loadItems() -> [TradeContents] {
        let tempItems = [TradeContents(title: "자전거", city: "목동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "신정동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "신월동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "개봉동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "부곡동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "가산", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "대림", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "화곡동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "도림동", price: "20000", itemImage: nil),
                         TradeContents(title: "자전거", city: "영등포동", price: "20000", itemImage: nil)]
        
        return tempItems
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tradeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") ?? UITableViewCell(style: .subtitle,
                                                                                                   reuseIdentifier: "defaultCell")
        let item = tradeItems[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.city
        
        return cell
    }
    
}


