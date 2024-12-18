//
//  AuthViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import UIKit

class AuthViewController: UIViewController {
    
    var presenter: AuthPresenter!
    
    private let logoImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "logo")
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            return imageView
        }()
        
        private let emailTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Email"
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 8
            textField.backgroundColor = UIColor.systemGray6
            textField.textColor = UIColor.darkGray
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemGray4.cgColor
            textField.setLeftPaddingPoints(10)
            return textField
        }()
        
        private let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Пароль"
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            textField.layer.cornerRadius = 8
            textField.backgroundColor = UIColor.systemGray6
            textField.textColor = UIColor.darkGray
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.systemGray4.cgColor
            textField.setLeftPaddingPoints(10)
            return textField
        }()
        
        private let loginButton: UIButton = {
            let button = UIButton()
            button.setTitle("Вход", for: .normal)
            button.backgroundColor = UIColor.systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.systemBlue.cgColor
            button.layer.shadowOpacity = 0.4
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            return button
        }()
        
        private let registerButton: UIButton = {
            let button = UIButton()
            button.setTitle("Регистрация", for: .normal)
            button.backgroundColor = UIColor.systemPink
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.layer.shadowColor = UIColor.systemGray.cgColor
            button.layer.shadowOpacity = 0.4
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.systemMint
            setupUI()
            
            loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
            registerButton.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        }
        
        private func setupUI() {
            let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, registerButton])
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            
            view.addSubview(logoImageView)
            view.addSubview(stackView)
            
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.widthAnchor.constraint(equalToConstant: 150),
                logoImageView.heightAnchor.constraint(equalToConstant: 150)
            ])
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            ])
        }
        
        @objc func handleLogin() {

    guard let email = emailTextField.text, let password = passwordTextField.text else { return }
            presenter.handleLogin(email: email, password: password)
        }
        
        @objc func handleRegistration() {
            guard let email = emailTextField.text, let password = passwordTextField.text else { return }
            presenter.handleRegistration(email: email, password: password)
        }
    }

    extension UITextField {
        func setLeftPaddingPoints(_ amount: CGFloat) {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    

