//
//  LanguageViewController.swift
//  RX_versus_delegate
//
//  Created by Marat Guseynov on 24.01.2024.
//

import UIKit


class LanguageViewController: UIViewController {
    
    //MARK: - REACTING TO BUTTONS TAP
    
    private func englishLanguageChosen() {
        
    }
    
    private func russianLanguageChosen() {
        
    }
    
    //MARK: - English button config
    
    private lazy var englishtButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(englishtButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - функция обработки нажатия на кнопку выбора языка English
    
    @objc private func englishtButtonPressed(sender: UIButton) {
        englishLanguageChosen()
        sender.backgroundColor = .systemBlue
        englishtButtonTitleLabel.textColor = .white
        englishtButton.addSubview(englishtButtonCheckmark)
        NSLayoutConstraint.activate([
            englishtButtonCheckmark.trailingAnchor.constraint(equalTo: englishtButton.trailingAnchor, constant: -24),
            englishtButtonCheckmark.centerYAnchor.constraint(equalTo: englishtButton.centerYAnchor),
        ])
        russianButton.backgroundColor = .systemGray5
        russianButtonTitleLabel.textColor = .darkGray
        russianButtonCheckmark.removeFromSuperview()
    }
    
    private let englishtButtonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "English"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let englishtButtonCheckmark: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(systemName: "checkmark")
        image.tintColor = .white
        return image
    }()
    
    //MARK: - Russian button config
    
    private lazy var russianButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(russianButtonPressed), for: .touchUpInside)
        return button
    }()
    //MARK: - функция обработки нажатия на кнопку выбора языка Russian
    
    @objc private func russianButtonPressed(sender: UIButton) {
        russianLanguageChosen()
        sender.backgroundColor = .systemBlue
        russianButtonTitleLabel.textColor = .white
        russianButton.addSubview(russianButtonCheckmark)
        NSLayoutConstraint.activate([
            russianButtonCheckmark.trailingAnchor.constraint(equalTo: russianButton.trailingAnchor, constant: -24),
            russianButtonCheckmark.centerYAnchor.constraint(equalTo: russianButton.centerYAnchor),
        ])
        englishtButton.backgroundColor = .systemGray5
        englishtButtonTitleLabel.textColor = .darkGray
        englishtButtonCheckmark.removeFromSuperview()
    }
    
    private let russianButtonTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Russian"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private let russianButtonCheckmark: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage.init(systemName: "checkmark")
        image.tintColor = .white
        return image
    }()
    
    private func addViews() {
        view.addSubview(englishtButton)
        englishtButton.addSubview(englishtButtonTitleLabel)
        
        view.addSubview(russianButton)
        russianButton.addSubview(russianButtonTitleLabel)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            //MARK: - English button config
            englishtButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            englishtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            englishtButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            englishtButton.heightAnchor.constraint(equalToConstant: 56),
            
            englishtButtonTitleLabel.leadingAnchor.constraint(equalTo: englishtButton.leadingAnchor, constant: 24),
            englishtButtonTitleLabel.centerYAnchor.constraint(equalTo: englishtButton.centerYAnchor),
            
            //MARK: - Russian button config
            russianButton.topAnchor.constraint(equalTo: englishtButton.bottomAnchor, constant: 28),
            russianButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            russianButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            russianButton.heightAnchor.constraint(equalToConstant: 56),
            
            russianButtonTitleLabel.leadingAnchor.constraint(equalTo: russianButton.leadingAnchor, constant: 24),
            russianButtonTitleLabel.centerYAnchor.constraint(equalTo: russianButton.centerYAnchor),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupNavigationBar()
        layout()
        customNavBarButtonBACK()
    }
    
    //MARK: - Custom nav bar back button config
    
    private func customNavBarButtonBACK() {
        let backButtonImage = UIImage(named: "backButton")
        
        // Create a custom button with the image
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
        
        // Create a UIBarButtonItem with the custom button
        let customBackButton = UIBarButtonItem(customView: backButton)
        
        // Set the custom button as the left bar button item
        self.navigationItem.leftBarButtonItem = customBackButton
    }
    
    // Function to handle the custom back button's tap event
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Custom nav bar title config

private extension LanguageViewController {
    
    private  func setupNavigationBar() {
        
        let titleView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Language"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .black
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        titleView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
        ])
        navigationItem.titleView = titleView
    }
}

