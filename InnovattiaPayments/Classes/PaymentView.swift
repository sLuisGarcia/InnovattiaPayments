//
//  PaymentView.swift
//  InnovattiaPayments
//
//  Created by Luis García on 15/03/23.
//

import UIKit
import DropDown

// MARK: - View Delegate
protocol PaymentViewDelegate: AnyObject {
    func tryPayment(_ payment: PaymentModel)
}

class PaymentView: UIView {
    
    // MARK: - Variable declaration
    private weak var delegate: PaymentViewDelegate?
    private enum TextFieldTag {
        static let name = 1
        static let phone = 2
        static let mail = 3
        static let cardNumber = 4
        static let month = 5
        static let year = 6
        static let cvv = 7
        static let address = 8
        static let zipCode = 9
        static let colony = 10
    }
    private let monthArray = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    var bgButtonDisable: UIColor = .gray
    var bgButtonEnable: UIColor = .blue
    var textButtonDisableColor: UIColor = .black
    var textButtonEnableColor: UIColor = .white
    
    // MARK: - View declaration
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.backgroundColor = .clear
        scroll.bounces = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private let lblContactData: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font.withSize(16)
        return lbl
    }()
    private let txtFieldName: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.name
        return txt
    }()
    private let txtFieldPhone: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.phone
        return txt
    }()
    private let txtFieldMail: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.mail
        return txt
    }()
    
    private let lblCardData: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font.withSize(16)
        return lbl
    }()
    private let txtFieldCardNumber: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.cardNumber
        return txt
    }()
    private let txtFieldMonth: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.month
        return txt
    }()
    private let txtFieldYear: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.year
        return txt
    }()
    private let txtFieldCvv: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.cvv
        return txt
    }()
    
    private let lblAddressData: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textColor = .black
        lbl.font.withSize(16)
        return lbl
    }()
    private let txtFieldAddress: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.address
        return txt
    }()
    private let txtFieldZipCode: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.zipCode
        return txt
    }()
    private let txtFieldColony: UITextField = {
        let txt = UITextField(frame: .zero)
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 0.5
        txt.layer.cornerRadius = 10
        txt.backgroundColor = .white
        txt.tag = TextFieldTag.colony
        return txt
    }()
    
    private let buttonPayment: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    // MARK: - Override Methods
    init(frame: CGRect, delegate: PaymentViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initializers
    internal func initUI() {
        initViews()
        initStrings()
        initConstraints()
        initListeners()
    }
    
    // MARK: - Add subviews
    internal func initViews() {
        addSubview(scrollView)
        scrollView.addSubview(lblContactData)
        scrollView.addSubview(txtFieldName)
        scrollView.addSubview(txtFieldPhone)
        scrollView.addSubview(txtFieldMail)
        scrollView.addSubview(lblCardData)
        scrollView.addSubview(txtFieldCardNumber)
        scrollView.addSubview(txtFieldMonth)
        scrollView.addSubview(txtFieldYear)
        scrollView.addSubview(txtFieldCvv)
        scrollView.addSubview(lblAddressData)
        scrollView.addSubview(txtFieldAddress)
        scrollView.addSubview(txtFieldZipCode)
        scrollView.addSubview(txtFieldColony)
        scrollView.addSubview(buttonPayment)
    }
    
    // MARK: - Add Strings
    internal func initStrings() {
        lblContactData.text = "Datos de contacto"
        txtFieldName.placeholder = "Nombre"
        txtFieldPhone.placeholder = "Teléfono (10 Dígitos)"
        txtFieldMail.placeholder = "Correo electrónico"
        lblCardData.text = "Datos de la tarjeta"
        txtFieldCardNumber.placeholder = "Número de tarjeta"
        txtFieldMonth.placeholder = "MM"
        txtFieldYear.placeholder = "AA"
        txtFieldCvv.placeholder = "CVV"
        lblAddressData.text = "Dirección de la tarjeta"
        txtFieldAddress.placeholder = "Dirección"
        txtFieldZipCode.placeholder = "C.P."
        txtFieldColony.placeholder = "Colonia"
        buttonPayment.setTitle("Pagar", for: .normal)
        buttonPayment.setTitleColor(textButtonDisableColor, for: .normal)
        buttonPayment.backgroundColor = bgButtonDisable
    }
    
    // MARK: - Add Constraints
    internal func initConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        lblContactData.translatesAutoresizingMaskIntoConstraints = false
        txtFieldName.translatesAutoresizingMaskIntoConstraints = false
        txtFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        txtFieldMail.translatesAutoresizingMaskIntoConstraints = false
        lblCardData.translatesAutoresizingMaskIntoConstraints = false
        txtFieldCardNumber.translatesAutoresizingMaskIntoConstraints = false
        txtFieldMonth.translatesAutoresizingMaskIntoConstraints = false
        txtFieldYear.translatesAutoresizingMaskIntoConstraints = false
        txtFieldCvv.translatesAutoresizingMaskIntoConstraints = false
        lblAddressData.translatesAutoresizingMaskIntoConstraints = false
        txtFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        txtFieldZipCode.translatesAutoresizingMaskIntoConstraints = false
        txtFieldColony.translatesAutoresizingMaskIntoConstraints = false
        buttonPayment.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            lblContactData.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            lblContactData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lblContactData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            lblContactData.heightAnchor.constraint(equalToConstant: 24),
            
            txtFieldName.topAnchor.constraint(equalTo: lblContactData.bottomAnchor, constant: 16),
            txtFieldName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldName.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldPhone.topAnchor.constraint(equalTo: txtFieldName.bottomAnchor, constant: 24),
            txtFieldPhone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldPhone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldPhone.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldMail.topAnchor.constraint(equalTo: txtFieldPhone.bottomAnchor, constant: 24),
            txtFieldMail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldMail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldMail.heightAnchor.constraint(equalToConstant: 40),
            
            lblCardData.topAnchor.constraint(equalTo: txtFieldMail.bottomAnchor, constant: 24),
            lblCardData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lblCardData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            lblCardData.heightAnchor.constraint(equalToConstant: 24),
            
            txtFieldCardNumber.topAnchor.constraint(equalTo: lblCardData.bottomAnchor, constant: 16),
            txtFieldCardNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldCardNumber.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldCardNumber.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldMonth.topAnchor.constraint(equalTo: txtFieldCardNumber.bottomAnchor, constant: 24),
            txtFieldMonth.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldMonth.heightAnchor.constraint(equalToConstant: 40),
            txtFieldMonth.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.28, constant: 1.0),
            
            txtFieldYear.topAnchor.constraint(equalTo: txtFieldCardNumber.bottomAnchor, constant: 24),
            txtFieldYear.leadingAnchor.constraint(equalTo: txtFieldMonth.trailingAnchor),
            txtFieldYear.trailingAnchor.constraint(equalTo: txtFieldCvv.leadingAnchor),
            txtFieldYear.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldCvv.topAnchor.constraint(equalTo: txtFieldCardNumber.bottomAnchor, constant: 24),
            txtFieldCvv.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldCvv.heightAnchor.constraint(equalToConstant: 40),
            txtFieldCvv.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.28, constant: 1.0),
            
            lblAddressData.topAnchor.constraint(equalTo: txtFieldMonth.bottomAnchor, constant: 24),
            lblAddressData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lblAddressData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            lblAddressData.heightAnchor.constraint(equalToConstant: 24),
            
            txtFieldAddress.topAnchor.constraint(equalTo: lblAddressData.bottomAnchor, constant: 16),
            txtFieldAddress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldAddress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldAddress.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldZipCode.topAnchor.constraint(equalTo: txtFieldAddress.bottomAnchor, constant: 24),
            txtFieldZipCode.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldZipCode.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldZipCode.heightAnchor.constraint(equalToConstant: 40),
            
            txtFieldColony.topAnchor.constraint(equalTo: txtFieldZipCode.bottomAnchor, constant: 24),
            txtFieldColony.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            txtFieldColony.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            txtFieldColony.heightAnchor.constraint(equalToConstant: 40),
            
            buttonPayment.topAnchor.constraint(equalTo: txtFieldColony.bottomAnchor, constant: 24),
            buttonPayment.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            buttonPayment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            buttonPayment.heightAnchor.constraint(equalToConstant: 50),
            buttonPayment.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
    
    // MARK: - Add Listeners
    internal func initListeners() {
        txtFieldName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldPhone.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldMail.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldCardNumber.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldMonth.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showMonths)))
        txtFieldYear.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showYears)))
        txtFieldCvv.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldAddress.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldZipCode.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        txtFieldColony.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        buttonPayment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doPayment)))
        txtFieldName.delegate = self
        txtFieldPhone.delegate = self
        txtFieldMail.delegate = self
        txtFieldCardNumber.delegate = self
        txtFieldMonth.delegate = self
        txtFieldYear.delegate = self
        txtFieldCvv.delegate = self
        txtFieldAddress.delegate = self
        txtFieldZipCode.delegate = self
        txtFieldColony.delegate = self
    }
}

//MARK: - Textfield functions
extension PaymentView: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        let nameValidation = validateTextField(txtFieldName.text ?? "", 0, false)
        let phoneValidation = validateTextField(txtFieldPhone.text ?? "", 10)
        let mailValidation = validateTextField(txtFieldMail.text ?? "", 0, false)
        let cardValidation = validateTextField(txtFieldCardNumber.text ?? "", 18)
        let monthValidation = validateTextField(txtFieldMonth.text ?? "", 2)
        let yearValidation = validateTextField(txtFieldYear.text ?? "", 4)
        let cvvValidation = validateTextField(txtFieldCvv.text ?? "", 3)
        let addressValidation = validateTextField(txtFieldAddress.text ?? "", 0, false)
        let zipValidation = validateTextField(txtFieldZipCode.text ?? "", 5)
        let colonyValidation = validateTextField(txtFieldColony.text ?? "", 0, false)
        if nameValidation, phoneValidation, mailValidation, cardValidation, monthValidation,
           yearValidation, cvvValidation, addressValidation, zipValidation, colonyValidation {
            buttonPayment.isEnabled = true
            buttonPayment.setTitleColor(textButtonEnableColor, for: .normal)
            buttonPayment.backgroundColor = bgButtonEnable
        } else {
            buttonPayment.isEnabled = false
            buttonPayment.setTitleColor(textButtonDisableColor, for: .normal)
            buttonPayment.backgroundColor = bgButtonDisable
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        switch textField.tag {
        case TextFieldTag.name, TextFieldTag.mail, TextFieldTag.address, TextFieldTag.colony:
            return newString.length <= 40
        case TextFieldTag.cardNumber:
            return newString.length <= 18
        case TextFieldTag.phone:
            return newString.length <= 10
        case TextFieldTag.zipCode:
            return newString.length <= 5
        case TextFieldTag.month:
            return newString.length <= 2
        case TextFieldTag.year:
            return newString.length <= 4
        case TextFieldTag.cvv:
            return newString.length <= 3
        default:
            return newString.length <= 20
        }
    }
    
    private func validateTextField(_ text: String, _ maxLenght: Int, _ validateLenght: Bool = true) -> Bool {
        if validateLenght {
            if !text.isEmpty, text.count == maxLenght {
                return true
            } else {
                return false
            }
        } else {
            return (!text.isEmpty) ? true : false
        }
    }
}

// MARK: - View Methods
extension PaymentView {
    @objc func showMonths() {
        let monthDropDown = DropDown()
        monthDropDown.dataSource = monthArray
        monthDropDown.anchorView = txtFieldMonth
        monthDropDown.dismissMode = .automatic
        monthDropDown.direction = .bottom
        monthDropDown.selectionAction = {(index: Int, item: String) in
            self.txtFieldMonth.text = item
        }
        monthDropDown.show()
    }
    
    @objc func showYears() {
        var yearArray: [String] = []
        let currentYear = Calendar.current.component(.year, from: Date())
        for i in 0...19 {
            yearArray.append("\(currentYear + i)")
        }
        let yearDropDown = DropDown()
        yearDropDown.dataSource = yearArray
        yearDropDown.anchorView = txtFieldYear
        yearDropDown.dismissMode = .automatic
        yearDropDown.direction = .bottom
        yearDropDown.selectionAction = {(index: Int, item: String) in
            self.txtFieldYear.text = item
        }
        yearDropDown.show()
    }
    
    @objc func doPayment() {
        var payment = PaymentModel()
        payment.name = txtFieldName.text ?? ""
        payment.phone = txtFieldPhone.text ?? ""
        payment.mail = txtFieldMail.text ?? ""
        payment.cardNumber = txtFieldCardNumber.text ?? ""
        payment.expMonth = txtFieldMonth.text ?? ""
        payment.expYear = txtFieldYear.text ?? ""
        payment.cvv = txtFieldCvv.text ?? ""
        payment.address = txtFieldAddress.text ?? ""
        payment.zipCode = txtFieldZipCode.text ?? ""
        payment.colony = txtFieldColony.text ?? ""
        delegate?.tryPayment(payment)
    }
}

//MARK: - Custom UI functions
extension PaymentView {
    internal func setDisableColors(_ bgColor: UIColor, _ textColor: UIColor) {
        bgButtonDisable = bgColor
        textButtonDisableColor = textColor
        buttonPayment.backgroundColor = bgButtonDisable
        buttonPayment.setTitleColor(textButtonDisableColor, for: .normal)
    }
    
    internal func setEnableColors(_ bgColor: UIColor, _ textColor: UIColor) {
        bgButtonEnable = bgColor
        textButtonEnableColor = textColor
    }
    
    internal func setTextColor(_ textColor: UIColor) {
        txtFieldName.textColor = textColor
        txtFieldPhone.textColor = textColor
        txtFieldMail.textColor = textColor
        txtFieldCardNumber.textColor = textColor
        txtFieldMonth.textColor = textColor
        txtFieldYear.textColor = textColor
        txtFieldCvv.textColor = textColor
        txtFieldAddress.textColor = textColor
        txtFieldZipCode.textColor = textColor
        txtFieldColony.textColor = textColor
    }
}
