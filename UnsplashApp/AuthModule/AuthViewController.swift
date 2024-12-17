//
//  AuthViewController.swift
//  UnsplashApp
//
//  Created by Stanislav Sakhipov on 12/17/24.
//

import UIKit

class AuthViewController: UIViewController {

    private let regMainTitle = UILabel()
    private let userNameLabel = UILabel()
    private let userNameTextField = UITextField()
    private let userPasswordLabel = UILabel()
    private let userPasswordTextField = UITextField()
    private let confirmPassLabel = UILabel()
    private let confirmPassTextField = UITextField()
    private let saveButton = UIButton()
    private let imageBack = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        view.addSubview(imageBack)
        view.addSubview(regMainTitle)
        view.addSubview(userNameLabel)
        view.addSubview(userNameTextField)
        view.addSubview(userPasswordLabel)
        view.addSubview(userPasswordTextField)
        view.addSubview(confirmPassLabel)
        view.addSubview(confirmPassTextField)
        view.addSubview(saveButton)
        
        regMainTitle.translatesAutoresizingMaskIntoConstraints = false
        regMainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        regMainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        regMainTitle.text = "Registration Form"
        regMainTitle.font = .systemFont(ofSize: 30)
        regMainTitle.textColor = .white
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: regMainTitle.bottomAnchor, constant: 20).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        userNameLabel.text = "Username"
        userNameLabel.textColor = .white
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 15).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        userNameTextField.placeholder = "Please enter username"
        userNameTextField.backgroundColor = .white
        
        userPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        userPasswordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20).isActive = true
        userPasswordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        userPasswordLabel.text = "Password"
        userPasswordLabel.textColor = .white
        
        userPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        userPasswordTextField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 15).isActive = true
        userPasswordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        userPasswordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        userPasswordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        userPasswordTextField.isSecureTextEntry = true
        userPasswordTextField.placeholder = "Please enter password"
        userPasswordTextField.backgroundColor = .white
        
        confirmPassLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPassLabel.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 30).isActive = true
        confirmPassLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        confirmPassLabel.text = "Confirm password"
        confirmPassLabel.textColor = .white
        
        confirmPassTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPassTextField.topAnchor.constraint(equalTo: confirmPassLabel.bottomAnchor, constant: 15).isActive = true
        confirmPassTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        confirmPassTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        confirmPassTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        confirmPassTextField.isSecureTextEntry = true
        confirmPassTextField.placeholder = "Please confirm password"
        confirmPassTextField.backgroundColor = .white
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 100).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 140).isActive = true
//        saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        saveButton.backgroundColor = .white
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        
        imageBack.translatesAutoresizingMaskIntoConstraints = false
//        imageBack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        imageBack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageBack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageBack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageBack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageBack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        imageBack.image = UIImage(named: "Image")
        
    }
    
    @objc public func pressedButton(){
        print("Saved")
    }
    
}

