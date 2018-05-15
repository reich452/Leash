//
//  SignUpPage.swift
//  Leash
//
//  Created by Nick Reichard on 5/12/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class SignUpPage: UIViewController, OnboardingScreen {
    
    // MARK: - Internal properties
    
    var page: OnboardingState.Page = .signUp
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstratins()
        setupInputFields()
        setUpPageControllConstraints()
    }
    
    // MARK: - Fields
    
    let leashLabel: UILabel = {
        let label = UILabel()
        label.text = "leash"
        label.textColor = UIColor.leashPurple
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.font = CustomFonts.zapfino.of(size: 32)
    
        return label
    }()
    
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
    
//    let emailTextField: LeashTextField = {
//        let tf = LeashTextField()
//        tf.attributedPlaceholder = "sign up with email".attributedString(aligment: .center)
//        tf.setValue(UIColor.purplePlaceHolder, forKeyPath: Constants.placeHolderPath.rawValue)
//        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
//        tf.borderStyle = .roundedRect
//        tf.font = UIFont.systemFont(ofSize: 17)
//        tf.boarderWidth = 1
//        tf.cornerRadius = 5
//        tf.boarderColor = UIColor.leashPurple
//        tf.clipsToBounds = true
//        tf.backgroundColor = .white
//        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
//
//        return tf
//    }()
    
    
    let emailButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign up with email", for: .normal)
        button.setTitleColor(UIColor.purplePlaceHolder, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.leashPurple.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)

        return button
    }()
    
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.textColor = UIColor.leashPurple
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
//    let mobileTextField: LeashTextField = {
//        let tf = LeashTextField()
//        tf.attributedPlaceholder = "sign up with phone".attributedString(aligment: .center)
//        tf.setValue(UIColor.purplePlaceHolder, forKeyPath: Constants.placeHolderPath.rawValue)
//        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
//        tf.borderStyle = .roundedRect
//        tf.font = UIFont.systemFont(ofSize: 17)
//        tf.boarderWidth = 1
//        tf.cornerRadius = 5
//        tf.boarderColor = UIColor.leashPurple
//        tf.clipsToBounds = true
//        tf.backgroundColor = .white
//
//        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
//
//        return tf
//    }()
    
    let moibleButton: UIButton = {
        let button = UIButton()
        button.setTitle("sign up with email", for: .normal)
        button.setTitleColor(UIColor.purplePlaceHolder, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0.5)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.leashPurple.cgColor
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let thankYouLabel: UILabel = {
        let label = UILabel()
        label.text = "Your pets will thank you"
        label.textColor = UIColor.leashPurple
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = OnboardingState.Page.all.count
        pc.currentPage = 0
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.leashPurple
        return pc
    }()
    
    
    // MARK: - Main
    
    @objc func handleButtonTapped() {
        let nextPage = OnboardingState(currentPage: page).nextPage
        performSegue(withIdentifier: "<#T##String#>", sender: nil)
        
    }

}

private extension SignUpPage {
    
    private func setupUI() {
    }
    
    // MARK: - Constraints
    
    private func setupConstratins() {
        view.addSubview(leashLabel)
        leashLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 45, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        leashLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        view.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: leashLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 25)
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(signUpLabel)
        signUpLabel.anchor(top: welcomeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 30)
        signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupInputFields() {
        let stackView = UIStackView(arrangedSubviews: [emailButton, orLabel, moibleButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.anchor(top: signUpLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
    }
    
    private func setUpPageControllConstraints() {
        let stackView = UIStackView(arrangedSubviews: [pageControl,thankYouLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 1
        view.addSubview(stackView)
        
        stackView.anchor(top: view.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -80, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 50)
    }
    
}

extension SignUpPage: StoryboardInitializable {
    
    static var storyboardName: String { return String(describing: Onboarding.self) }
}
