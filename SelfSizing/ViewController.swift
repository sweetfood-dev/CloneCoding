//
//  ViewController.swift
//  SelfSizing
//
//  Created by 권지수 on 2021/10/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberButtons: [CircleButton]!
    @IBOutlet var phoneCallButton: CircleButton!
    
    var phoneNumberString = "" {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in phoneNumberButtons {
            button.addTarget(self, action: #selector(onNumberBtnClick(_:)), for: .touchUpInside)
        }
        
        phoneCallButton.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onNumberBtnClick(_ sender: UIButton) {
        guard let inputTitle = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputTitle)
    }
    
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton) {
        phoneNumberString.removeAll()
    }


}

