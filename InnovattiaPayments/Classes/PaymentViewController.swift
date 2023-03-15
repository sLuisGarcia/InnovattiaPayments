//
//  PaymentViewController.swift
//  InnovattiaPayments
//
//  Created by Luis García on 15/03/23.
//

import UIKit
import SrPago

public class PaymentViewController: UIViewController {

    // MARK: - Variable declaration
    lazy var mainView: PaymentView? = {
        return PaymentView(frame: UIScreen.main.bounds, delegate: self)
    }()
    public var callback : ((String) -> Void)?
    
    // MARK: - Initializers
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        super.view = mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func initUI() {
        self.view.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.93, alpha: 1.00)
    }
}

// MARK: - View Methods
extension PaymentViewController: PaymentViewDelegate {
    func tryPayment(_ payment: PaymentModel) {
////        let srPago: SrPago = SrPago()
//        let srPago: SrPago = SrPago.sharedInstance() as! SrPago
//        srPago.publishableKey = ""
//        srPago.liveMode = false
//
//        let card = SPCard()
//        card.name = ""
//        card.number = ""
//        card.expMonth = ""
//        card.expYear = ""
//        card.cvv = ""
//
//        srPago.token.createToken(with: card) { token in
//            if let token = token?.token {
//                self.callback?(token)
//            }
//        } onFail: { error in
//            if let error = error?.message {
//                self.callback?(error)
//            }
//        }
        self.callback?(payment.cardNumber)
    }
}

//MARK: - Custom UI functions
extension PaymentViewController {
    public func setDisableColors(_ bgColor: UIColor, _ textColor: UIColor) {
        mainView?.setDisableColors(bgColor, textColor)
    }
    
    public func setEnableColors(_ bgColor: UIColor, _ textColor: UIColor) {
        mainView?.setEnableColors(bgColor, textColor)
    }
    
    public func setTextColor(_ textColor: UIColor) {
        mainView?.setTextColor(textColor)
    }
}
