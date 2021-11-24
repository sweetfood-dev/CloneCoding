//
//  ItemInfoView.swift
//  Clone_Dangeun
//
//  Created by todoc on 2021/11/24.
//

import UIKit

class ItemInfoView: UIView {
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image?.withTintColor(.lightGray)
//        imageView.image = UIImage(systemName: "message.and.waveform")
        return imageView
    }()
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.text = "0"
        return label
    }()
    
    convenience init(image: String) {
        self.init(frame: CGRect.zero)
        iconImage.image = UIImage(systemName: image)
        setAutolayout()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAutolayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setAutolayout()
    }
    
    private func setAutolayout() {
        addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.leading.equalToSuperview()
        }
        addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImage.snp.trailing).offset(0)
            make.bottom.top.trailing.equalToSuperview()
        }
    }
    func updateLabel(count: Int){
        if count > 0 {
            isHidden = false
            countLabel.text = "\(count)"
        }else { hiddenView() }
    }
    
    func hiddenView() {
        countLabel.text = "0"
        isHidden = true
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ItemInfoViewRepresentable<View: UIView>: UIViewRepresentable {
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
struct ItemInfoViewPreview: PreviewProvider {
    static var previews: some View {
        ItemInfoViewRepresentable {
            let cell = ItemInfoView(frame: .zero)
            return cell
        }.previewLayout(.sizeThatFits)
    }
}
#endif
