//
//  TestViewController.swift
//  InnovattiaPayments_Example
//
//  Created by Luis García on 15/03/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import InnovattiaPayments

class TestViewController: UIViewController {

    // MARK: - Variable declaration
    lazy var mainView: TestView? = {
        return TestView(frame: UIScreen.main.bounds, delegate: self)
    }()
    
    // MARK: - Override Methods
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Initializers
    private func initUI() {
        self.view.backgroundColor = .white
    }
}

// MARK: - View Methods
extension TestViewController: TestViewDelegate {
    func showPod() {
        let view = PaymentViewController()
//        view.setDisableColors(.yellow, .blue)
//        view.setEnableColors(.green, .cyan)
//        view.setTextColor(.red)
        view.callback = { response in
            print(response)
            self.navigationController?.popViewController(animated: true)
        }
        self.navigationController?.pushViewController(view, animated: true)
    }
}
