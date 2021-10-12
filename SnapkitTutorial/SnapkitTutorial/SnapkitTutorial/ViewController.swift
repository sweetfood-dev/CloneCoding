//
//  ViewController.swift
//  SnapkitTutorial
//
//  Created by todoc on 2021/10/12.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    lazy var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    lazy var thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    lazy var numberLabel: UILabel = {
        let mLabel = UILabel()
        mLabel.text = "전화번호를 입력하세요"
        mLabel.textAlignment = .center
        mLabel.font = .boldSystemFont(ofSize: 30)
        mLabel.textColor = .gray
        mLabel.minimumScaleFactor = 0.5
        mLabel.adjustsFontSizeToFitWidth = true
        return mLabel
    }()
    
    var numberString: String = ""{
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.numberLabel.text = self.numberString.count == 0 ? "전화번호를 입력하세요" : self.numberString
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(totalStackView)
        self.view.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
//            make.top.equalToSuperview().offset(100)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.height.equalTo(50)
        }
        totalStackView.addArrangedSubview(firstStackView)
        totalStackView.addArrangedSubview(secondStackView)
        totalStackView.addArrangedSubview(thirdStackView)
        totalStackView.snp.makeConstraints { make in
            make.top.equalTo(numberLabel.snp.bottom).offset(20)
            make.leading.equalTo(numberLabel.snp.leading)
            make.trailing.equalTo(numberLabel.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        let firstStackViewItems = ["1","4","7","*","empty"]
        let secondStackViewItems = ["2","5","8","0","Call"]
        let thirdStackViewItems = ["3","6","9","#","empty"]
        
        makeButton(at: firstStackView, items: firstStackViewItems)
        makeButton(at: secondStackView, items: secondStackViewItems)
        makeButton(at: thirdStackView, items: thirdStackViewItems)
    }
}
extension ViewController {
    @objc func buttonClickAction(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        numberString.append(title)
    }
    @objc func callButtonAction(_ sender: UIButton) {
        numberString.removeAll()
    }
    func makeButton(at stackView: UIStackView, items: [String]) {
        for i in 0 ..< 5 {
            let title = items[i]
            switch title {
            case "empty":
                let emptyView = UIView()
//                emptyView.snp.makeConstraints { make in
//                    make.size.equalTo(CGSize(width: 40, height: 40))
//                }
                stackView.addArrangedSubview(emptyView)
            default:
                let numberBtn = UIButton()
                numberBtn.snp.makeConstraints { make in
                    make.size.equalTo(CGSize(width: 40, height: 40))
                }
                numberBtn.layer.cornerRadius = 20
                numberBtn.titleLabel?.font = .boldSystemFont(ofSize: 30)
                numberBtn.setTitleColor(.black, for: .normal)
                numberBtn.setTitle(items[i], for: .normal)
                numberBtn.backgroundColor = .systemGray4
                if title == "Call" {
                    numberBtn.addTarget(self, action: #selector(callButtonAction(_:)), for: .touchUpInside)
                }
                else {
                    numberBtn.addTarget(self, action: #selector(buttonClickAction(_:)), for: .touchUpInside)
                }
                stackView.addArrangedSubview(numberBtn)
            }
        }
    }
}


#if DEBUG
import SwiftUI
struct LandscapeModifier: ViewModifier {
    let height = UIScreen.main.bounds.width // 1
    let width = UIScreen.main.bounds.height // 2
    
    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height)) // 3
            .environment(\.horizontalSizeClass, .compact)
            .environment(\.verticalSizeClass, .compact)
    }
}


extension View {
    func landscape() -> some View {
        self.modifier(LandscapeModifier())
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    @available(iOS 13, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("Snapkit Tutorial")
    }
}
#endif


