//
//  TradeContentsCell.swift
//  Clone_Dangeun
//
//  Created by todoc on 2021/11/23.
//

import UIKit

class TradeContentsCell: UITableViewCell {
    
    static let identifier = "contentsCell"
    
    let thumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.numberOfLines = 0
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "city"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "000원"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAutolayout()
    }
    
    override func awakeFromNib() {
        setAutolayout()
    }
    
    
    func setAutolayout() {
        contentView.addSubview(thumbnailView)
        thumbnailView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.width.height.equalTo(200)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailView)
            make.leading.equalTo(thumbnailView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(8)
        }
        
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(cityLabel)
            make.top.equalTo(cityLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellItem(_ item: TradeContents) {
        thumbnailView.image = item.itemImage ?? UIImage(systemName: "play.circle")
        titleLabel.text = item.title
        cityLabel.text = item.city
        priceLabel.text = item.price
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TradeContentsCellRepresentable<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TradeContentsCellPreview: PreviewProvider {
    static var previews: some View {
        TradeContentsCellRepresentable {
            let cell = TradeContentsCell(frame: .zero)
            return cell
        }.previewLayout(.sizeThatFits)
    }
}
#endif
