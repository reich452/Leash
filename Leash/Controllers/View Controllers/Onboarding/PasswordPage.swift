//
//  PasswordPage.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class PasswordPage: UIViewController, OnboardingScreen {
    
    // MARK: - Internal properties
    
    var page: OnboardingState.Page = .password
    
    var counter = 0 
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstratins()
        setupInputFields()
        setUpPageControllConstraints()
        print("Password page")
    }
    
    // MARK: - Fields
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, human!"
        label.textColor = UIColor.leashPurple
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign up to get started."
        label.textColor = UIColor.leashPurple
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let passowrdTextField: LeashTextField = {
        let tf = LeashTextField()
        tf.attributedPlaceholder = "enter in password".attributedString(aligment: .center)
        tf.setValue(UIColor.purplePlaceHolder, forKeyPath: Constants.placeHolderPath.rawValue)
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.boarderWidth = 1
        tf.cornerRadius = 5
        tf.boarderColor = UIColor.leashPurple
        tf.clipsToBounds = true
        tf.backgroundColor = .white
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.setTitleColor(UIColor.purplePlaceHolder, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.leashPurple.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handelNextButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = OnboardingState.Page.all.count
        pc.currentPage = 2
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.leashPurple
        return pc
    }()
    
    
    // MARK: - Main
    
    @objc func handleTextInputChange() {
        
    }
    
    @objc func handelNextButtonTapped() {
        
    }
    
}

private extension PasswordPage {
    
    private func setupUI() {
    }
    
    // MARK: - Constraints
    
    private func setupConstratins() {
        
        view.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 200, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 25)
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(signUpLabel)
        signUpLabel.anchor(top: welcomeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 30)
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [passowrdTextField, nextButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.anchor(top: signUpLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 90)
    }
    
    private func setUpPageControllConstraints() {
        let stackView = UIStackView(arrangedSubviews: [pageControl])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        stackView.anchor(top: view.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -80, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
    }
}

extension PasswordPage: StoryboardInitializable {
    
    static var storyboardName: String { return String(describing: Onboarding.self) }
}

