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
        imageView.image = UIImage(named: "defaultThumbnail")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title"
        label.numberOfLines = 2
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "city"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "000원"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var replyCountView: ItemInfoView = {
        let infoView = ItemInfoView(image: "message")
        return infoView
    }()
    private lazy var chatCountView: ItemInfoView = {
        let infoView = ItemInfoView(image:"message.and.waveform")
        return infoView
    }()
    private lazy var likeCountView: ItemInfoView = {
        let infoView = ItemInfoView(image: "heart")
        return infoView
    }()
            
    private lazy var infoHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    var replyCount: Int = 0 {
        didSet { replyCountView.updateLabel(count: replyCount) }
    }
    
    var chatCount: Int = 0 {
        didSet { chatCountView.updateLabel(count: chatCount) }
    }
    
    var likeCount: Int = 0 {
        didSet { likeCountView.updateLabel(count: likeCount) }
    }
    
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
            make.width.height.equalTo(120)
            make.top.bottom.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailView)
            //            make.height.lessThanOrEqualTo(50)
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
            make.height.equalTo(50)
        }
        
        contentView.addSubview(infoHStackView)
        infoHStackView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.leading.greaterThanOrEqualTo(thumbnailView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.bottom.equalTo(thumbnailView)
        }
        infoHStackView.addArrangedSubview(replyCountView)
        infoHStackView.addArrangedSubview(chatCountView)
        infoHStackView.addArrangedSubview(likeCountView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellItem(_ item: TradeContents) {
        thumbnailView.image = item.itemImage ?? UIImage(named: "defaultThumbnail")
        titleLabel.text = item.title
        cityLabel.text = item.city
        priceLabel.text = item.price + "원"
        
        replyCount = item.replyCount
        chatCount = item.chatCount
        likeCount = item.likeCount
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
