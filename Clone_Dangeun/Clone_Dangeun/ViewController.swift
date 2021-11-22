//
//  ViewController.swift
//  Clone_Dangeun
//
//  Created by todoc on 2021/11/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let dataSource = ContentsDataSource()
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = dataSource
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupAutolayout()
        setNavigationBar()
    }
    private func setupAutolayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        let barAppearance = UINavigationBarAppearance()
        
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.red,
                                                       .font : UIFont.boldSystemFont(ofSize: 15)]
        barAppearance.buttonAppearance = buttonAppearance
        
        let tempLabel = UILabel()
        tempLabel.text = "동네이름"
        tempLabel.font = UIFont.boldSystemFont(ofSize: 20)
        let leftButton = UIBarButtonItem(customView: tempLabel)
        
        let rightButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 50))
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        rightButtonView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let searchButton = UIButton()
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        let categoryButton = UIButton()
        categoryButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        let alertButton = UIButton()
        alertButton.setImage(UIImage(systemName: "bell"), for: .normal)
        stackView.addArrangedSubview(searchButton)
        stackView.addArrangedSubview(categoryButton)
        stackView.addArrangedSubview(alertButton)
        searchButton.addTarget(self, action: #selector(touchHandler(sender:)), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(touchHandler(sender:)), for: .touchUpInside)
        alertButton.addTarget(self, action: #selector(touchHandler(sender:)), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButtonView)
        
        navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
        
    }
    
    @objc func touchHandler(sender: UIButton) {
        print("touch event")
    }
}
