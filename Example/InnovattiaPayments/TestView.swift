//
//  TestView.swift
//  InnovattiaPayments_Example
//
//  Created by Luis García on 15/03/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import InnovattiaPayments

protocol TestViewDelegate: AnyObject {
    func showPod()
}

class TestView: UIView {
    
    // MARK: - Variable declaration
    private weak var delegate: TestViewDelegate?
    
    // MARK: - View declaration
    private let button: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setTitle("Prueba", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    // MARK: - Override Methods
    init(frame: CGRect, delegate: TestViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initializers
    internal func initUI() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPod)))
    }
    
    @objc func showPod() {
        delegate?.showPod()
    }

    
//    // MARK: - Add Listeners
//    internal func initListeners() {
//        self.btnBack.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(returnView)))
//        self.btnShare.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(share)))
//    }
}
