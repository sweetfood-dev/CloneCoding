//
//  ViewController.swift
//  PhoneCallCodeLayout
//
//  Created by Sweetfood-dev on 2021/10/04.
//

import UIKit

class ViewController: UIViewController {
    let defaultViewSize = 80
    let defaultFontSize: CGFloat = 30
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .gray
        label.text = "전화번호를 입력하세요"
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private var inputNumberString: String = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.phoneLabel.text = self.inputNumberString
            }
        }
    }
    
    let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    
    let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalStackView.addArrangedSubview(firstStackView)
        totalStackView.addArrangedSubview(secondStackView)
        totalStackView.addArrangedSubview(thirdStackView)
        
        view.addSubview(totalStackView)
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            totalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        setStackView()
        
        view.addSubview(phoneLabel)
        NSLayoutConstraint.activate([
            phoneLabel.bottomAnchor.constraint(equalTo: totalStackView.topAnchor, constant: -30),
            phoneLabel.leadingAnchor.constraint(equalTo: totalStackView.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: totalStackView.trailingAnchor),
        ])
    }
    func createButton(_ titleItems: [String], at stackView: UIStackView) {
        for title in titleItems {
            let circleBtn = CircleButton(frame: CGRect(x: 0, y: 0, width: defaultViewSize, height: defaultViewSize))
            circleBtn.cornerRadius = CGFloat(defaultViewSize / 2)
            circleBtn.setTitle(title, for: .normal)
            circleBtn.backgroundColor = .systemGray5
            circleBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: defaultFontSize)
            circleBtn.setTitleColor(.black, for: .normal)
            circleBtn.widthAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
            circleBtn.heightAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
            if title.elementsEqual("call") { circleBtn.addTarget(self, action: #selector(clearAction(_:)), for: .touchUpInside) }
            else { circleBtn.addTarget(self, action: #selector(numberClickAction(_:)), for: .touchUpInside) }
            stackView.addArrangedSubview(circleBtn)
        }
    }
    func setStackView() {
        let firstStackViewitem = ["1", "4", "7", "✳︎"]
        createButton(firstStackViewitem, at: firstStackView)
        let tempView = UIView()
        tempView.widthAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
        firstStackView.addArrangedSubview(tempView)
        
        let secondStackViewItem = ["2","5","8","0","call"]
        createButton(secondStackViewItem, at: secondStackView)
        
        let thirdStackViewItem = ["3", "6", "9", "#"]
        createButton(thirdStackViewItem, at: thirdStackView)
        let tempView2 = UIView()
        tempView2.widthAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
        tempView2.heightAnchor.constraint(equalToConstant: CGFloat(defaultViewSize)).isActive = true
        thirdStackView.addArrangedSubview(tempView2)
    }
    
    @objc func numberClickAction(_ sender: UIButton) {
        guard let numString = sender.titleLabel?.text else { return }
        inputNumberString.append(numString)
    }
    
    @objc func clearAction(_ sender: UIButton) {
        inputNumberString.removeAll()
    }
}


#if DEBUG
import SwiftUI
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
            .previewDisplayName("CloneCoding - 전화 UI_version_code")
    }
}
#endif
