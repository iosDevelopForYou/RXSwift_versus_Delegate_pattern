//
//  ProfileViewController.swift
//  RX_versus_delegate
//
//  Created by Marat Guseynov on 24.01.2024.
//

import UIKit

class ProfileViewController: UIViewController  {

    private let profileFotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "gilfoyle")
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Bertram Gilfoyle"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "pied@piper.com"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let chosenLanguageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "You need to set language"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - languageButton button config
    
    private lazy var languageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(languageButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - функция обработки нажатия на кнопку выбора языка
    
    @objc private func languageButtonPressed(sender: UIButton) {
        sender.alpha = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        let destinationVC = LanguageViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    private let languageButtonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Language"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let languageButtonArrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrowRight")
        return image
    }()
    
    //MARK: - Terms & Conditions button config
    
    private lazy var termsConditionsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(termsConditionsButtonPressed), for: .touchUpInside)
        return button
    }()
    // функция обработки нажатия на кнопку Terms & Conditions
    @objc private func termsConditionsButtonPressed(sender: UIButton) {
        sender.alpha = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        let secondDestinationVC = TermsConditionsViewController()
        navigationController?.pushViewController(secondDestinationVC, animated: true)
    }
    
    private let termsConditionsButtonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Terms & Conditions"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let termsConditionsButtonArrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "arrowRight")
        return image
    }()
    
    //MARK: - signOutButton button config
    
    private lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
        return button
    }()
    // функция обработки нажатия на кнопку signOutButton( здесь ничего не происходит кроме визуального эффекта)
    @objc private func signOutButtonPressed(sender: UIButton) {
        sender.alpha = 0.3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    private let signOutButtonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Sign Out"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let signOutButtonArrowImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "goOut")
        return image
    }()
    
 //MARK: - LAYOUT
    
    private func addViews() {
        view.addSubview(profileFotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        view.addSubview(chosenLanguageLabel)
        
        view.addSubview(languageButton)
        languageButton.addSubview(languageButtonTitleLabel)
        languageButton.addSubview(languageButtonArrowImage)
        
        view.addSubview(termsConditionsButton)
        termsConditionsButton.addSubview(termsConditionsButtonTitleLabel)
        termsConditionsButton.addSubview(termsConditionsButtonArrowImage)
        
        view.addSubview(signOutButton)
        signOutButton.addSubview(signOutButtonTitleLabel)
        signOutButton.addSubview(signOutButtonArrowImage)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            profileFotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileFotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileFotoImageView.heightAnchor.constraint(equalToConstant: 72),
            profileFotoImageView.widthAnchor.constraint(equalToConstant: 72),
            
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: profileFotoImageView.trailingAnchor, constant: 24),
            
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            
            chosenLanguageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chosenLanguageLabel.bottomAnchor.constraint(equalTo:  languageButton.topAnchor, constant: -15),
            
            //MARK: - languageButton button config
            languageButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 100),
            languageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            languageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            languageButton.heightAnchor.constraint(equalToConstant: 56),
            
            languageButtonTitleLabel.leadingAnchor.constraint(equalTo: languageButton.leadingAnchor, constant: 24),
            languageButtonTitleLabel.centerYAnchor.constraint(equalTo: languageButton.centerYAnchor),
            
            languageButtonArrowImage.trailingAnchor.constraint(equalTo: languageButton.trailingAnchor, constant: -24),
            languageButtonArrowImage.centerYAnchor.constraint(equalTo: languageButton.centerYAnchor),
            //MARK: - Terms & Conditions button config
            termsConditionsButton.topAnchor.constraint(equalTo: languageButton.bottomAnchor, constant: 240),
            termsConditionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            termsConditionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            termsConditionsButton.heightAnchor.constraint(equalToConstant: 56),
            
            termsConditionsButtonTitleLabel.leadingAnchor.constraint(equalTo: termsConditionsButton.leadingAnchor, constant: 24),
            termsConditionsButtonTitleLabel.centerYAnchor.constraint(equalTo: termsConditionsButton.centerYAnchor),
            
            termsConditionsButtonArrowImage.trailingAnchor.constraint(equalTo: termsConditionsButton.trailingAnchor, constant: -24),
            termsConditionsButtonArrowImage.centerYAnchor.constraint(equalTo: termsConditionsButton.centerYAnchor),
            //MARK: - Sign out button config
            signOutButton.topAnchor.constraint(equalTo: termsConditionsButton.bottomAnchor, constant: 28),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signOutButton.heightAnchor.constraint(equalToConstant: 56),
            
            signOutButtonTitleLabel.leadingAnchor.constraint(equalTo: signOutButton.leadingAnchor, constant: 24),
            signOutButtonTitleLabel.centerYAnchor.constraint(equalTo: signOutButton.centerYAnchor),
            
            signOutButtonArrowImage.trailingAnchor.constraint(equalTo: signOutButton.trailingAnchor, constant: -24),
            signOutButtonArrowImage.centerYAnchor.constraint(equalTo: signOutButton.centerYAnchor),
        ])
    }
    
//MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addViews()
        layout()
        
        self.title = "Profile"
        // создаем крупный шрифт в панели навигации
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
            NSAttributedString.Key.paragraphStyle: {
                let style = NSMutableParagraphStyle()
                style.firstLineHeadIndent = 0.0
                return style
            }()
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

