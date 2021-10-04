//
//  ViewController.swift
//  AutolayoutCode
//
//  Created by 권지수 on 2021/10/04.
//

import UIKit

class ViewController: UIViewController {
    // 클로저로 뷰를 설정
    let mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let myThirdView: UIView = {
        print("ThirdView Create")
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewdidload")
        let myFirstView = UIView()
        // 코드로 작업시에는 필수로 설정
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        // View 자체 프로퍼티를 설정
        view.addSubview(myFirstView)
        myFirstView.backgroundColor = .systemPink
        myFirstView.layer.cornerRadius = 20
        // 위치를 잡고
        myFirstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 18).isActive = true
        myFirstView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // 사이즈를 설정
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalTo: myFirstView.widthAnchor, multiplier: 0.5),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 0),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20)
        ])
        print("before add subview ThirdView")
        view.addSubview(myThirdView)
        NSLayoutConstraint.activate([
            myThirdView.topAnchor.constraint(equalTo: mySecondView.topAnchor),
            myThirdView.leftAnchor.constraint(equalTo: mySecondView.rightAnchor, constant: 10),
            myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor),
            myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor)
        ])
        print("after add subview ThirdView")
        //        mySecondView.widthAnchor.constraint(equalTo: myFirstView.widthAnchor, multiplier: 0.5).isActive = true
        //        mySecondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //        mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 0).isActive = true
        //        mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 20).isActive = true
    }
}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
    
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .previewDisplayName("아이폰 11")
    }
}
#endif

