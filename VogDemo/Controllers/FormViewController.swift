//
//  FormViewController.swift
//  VogDemo
//
//  Created by Nabil Muthanna on 2018-04-06.
//  Copyright © 2018 nabilmuthanna. All rights reserved.
//

import UIKit

final class FormViewController: UIViewController {
    
    
    // MARK: - UI
    
    var chatController: DetailViewController?
    
    private lazy var _usernameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftImage = #imageLiteral(resourceName: "username")
        textField.placeholder = "username"
        textField.color = StyleSheet.defaultTheme.secondaryColor
        textField.tintColor = StyleSheet.defaultTheme.secondaryColor
        textField.backgroundColor = StyleSheet.defaultTheme.contentBackgroundColor
        textField.leftPadding = 16
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.delegate = self
        textField.addTarget(self, action: #selector(checkUsername), for: .editingChanged)
        return textField
    }()
    private lazy var _passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "password"
        textField.color = StyleSheet.defaultTheme.secondaryColor
        textField.leftPadding = 16
        textField.isSecureTextEntry = true
        textField.leftImage = #imageLiteral(resourceName: "password")
        textField.tintColor = StyleSheet.defaultTheme.secondaryColor
        textField.backgroundColor = StyleSheet.defaultTheme.contentBackgroundColor
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.addTarget(self, action: #selector(checkPassword), for: .editingChanged)
        textField.delegate = self
        return textField
    }()
    private lazy var _submitBnt: RoundedButton = {
        let btn = RoundedButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Submit", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.backgroundColor = StyleSheet.defaultTheme.mainColor
        btn.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return btn
    }()
    private lazy var _stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self._usernameTextField, self._passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private var _username: String {
        return _usernameTextField.text ?? ""
    }
    private var _validUsername: Bool {
        guard let username = _usernameTextField.text else { return false }
        return username.count >= 8
    }
    private var _validPassword: Bool {
        guard let pass = _passwordTextField.text else { return false }
        return pass.count >= 8
    }
  
    
    // MARK: - Lifecycel + layout methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To dismiss keyboard upon clicking away
        let tab = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tab)
        view.backgroundColor = StyleSheet.defaultTheme.backgroundColor
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearInput()
    }
    
    private func clearInput() {
        _usernameTextField.text = nil
        _passwordTextField.text = nil
    }
    
    @objc func checkUsername() {
        _usernameTextField.color = _validUsername ? StyleSheet.defaultTheme.secondaryColor : UIColor.red
    }
    
    @objc func checkPassword() {
        _passwordTextField.color = _validPassword ? StyleSheet.defaultTheme.secondaryColor : UIColor.red
    }
    
    
    
    private func setupUI() {
        view.addSubviews([_stackView, _submitBnt])
        
        NSLayoutConstraint.activate([
            _stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            _stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            _stackView.widthAnchor.constraint(equalToConstant: 350),
            _stackView.heightAnchor.constraint(equalToConstant: 150),
            
            _submitBnt.leftAnchor.constraint(equalTo: _stackView.leftAnchor),
            _submitBnt.rightAnchor.constraint(equalTo: _stackView.rightAnchor),
            _submitBnt.topAnchor.constraint(equalTo: _stackView.bottomAnchor, constant: 64),
            _submitBnt.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
    
    //MARK: -  Event Handlers
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
   
    @objc func submit() {
       
        guard _validUsername else {
            _usernameTextField.shake()
            return
        }
        guard _validPassword else {
            _passwordTextField.shake()
            return
        }

        present(DetailViewController(username: _username), animated: true, completion: nil)
    }
}


extension FormViewController: UITextFieldDelegate {
   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField == _usernameTextField) {
            let characterSet = CharacterSet.letters
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }
        return true
    }

}

