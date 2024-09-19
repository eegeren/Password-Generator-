//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by Yusufege Eren on 17.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let passwordLengthLabel: UILabel = {
        let label = UILabel()
        label.text = "Password Length"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordLengthSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 4
        slider.maximumValue = 20
        slider.value = 8
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let lettersSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let lettersLabel: UILabel = {
        let label = UILabel()
        label.text = "Include Letters"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let numbersSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let numbersLabel: UILabel = {
        let label = UILabel()
        label.text = "Include Numbers"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let symbolsSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        return switchControl
    }()
    
    let symbolsLabel: UILabel = {
        let label = UILabel()
        label.text = "Include Symbols"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate Password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Generated Password:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generatedPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.monospacedSystemFont(ofSize: 22, weight: .bold)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let copyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Copy Password", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let numbers = "0123456789"
    let symbols = "!@#$%^&*()"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        setupLayout()
        
        generateButton.addTarget(self, action: #selector(generatePassword), for: .touchUpInside)
        copyButton.addTarget(self, action: #selector(copyPassword), for: .touchUpInside)

    }
    
    func setupLayout() {
        view.addSubview(passwordLengthLabel)
        view.addSubview(passwordLengthSlider)
        view.addSubview(lettersSwitch)
        view.addSubview(lettersLabel)
        view.addSubview(numbersSwitch)
        view.addSubview(numbersLabel)
        view.addSubview(symbolsSwitch)
        view.addSubview(symbolsLabel)
        view.addSubview(generateButton)
        view.addSubview(passwordLabel)
        view.addSubview(generatedPasswordLabel)
        view.addSubview(copyButton)
        
        NSLayoutConstraint.activate([
            copyButton.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 20),
               copyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               copyButton.widthAnchor.constraint(equalToConstant: 200),
               copyButton.heightAnchor.constraint(equalToConstant: 50),
        
            passwordLengthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            passwordLengthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            passwordLengthSlider.topAnchor.constraint(equalTo: passwordLengthLabel.bottomAnchor, constant: 10),
            passwordLengthSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLengthSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            lettersSwitch.topAnchor.constraint(equalTo: passwordLengthSlider.bottomAnchor, constant: 20),
            lettersSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            lettersLabel.centerYAnchor.constraint(equalTo: lettersSwitch.centerYAnchor),
            lettersLabel.leadingAnchor.constraint(equalTo: lettersSwitch.trailingAnchor, constant: 10),
            
            numbersSwitch.topAnchor.constraint(equalTo: lettersSwitch.bottomAnchor, constant: 20),
            numbersSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            numbersLabel.centerYAnchor.constraint(equalTo: numbersSwitch.centerYAnchor),
            numbersLabel.leadingAnchor.constraint(equalTo: numbersSwitch.trailingAnchor, constant: 10),
            
            symbolsSwitch.topAnchor.constraint(equalTo: numbersSwitch.bottomAnchor, constant: 20),
            symbolsSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            symbolsLabel.centerYAnchor.constraint(equalTo: symbolsSwitch.centerYAnchor),
            symbolsLabel.leadingAnchor.constraint(equalTo: symbolsSwitch.trailingAnchor, constant: 10),
            
            generateButton.topAnchor.constraint(equalTo: symbolsSwitch.bottomAnchor, constant: 30),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.widthAnchor.constraint(equalToConstant: 200),
            generateButton.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: generateButton.bottomAnchor, constant: 90 ),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            generatedPasswordLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            generatedPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generatedPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    @objc func copyPassword() {
        guard let password = generatedPasswordLabel.text, !password.isEmpty else { return
        }
        UIPasteboard.general.string = password
        print("Password copied to clipboard")
    }
    
    
    @objc func generatePassword() {
        let passwordLength = Int(passwordLengthSlider.value)
        var availableCharacters = ""
        
        if lettersSwitch.isOn {
            availableCharacters += letters
        }
        if numbersSwitch.isOn {
            availableCharacters += numbers
        }
        if symbolsSwitch.isOn {
            availableCharacters += symbols
        }
        
        guard !availableCharacters.isEmpty else {
            generatedPasswordLabel.text = "Please select at least one."
            return
        }
        
        let password = String((0..<passwordLength).map { _ in availableCharacters.randomElement()! })
        generatedPasswordLabel.text = password
        
        
        
        
    }
    
}

