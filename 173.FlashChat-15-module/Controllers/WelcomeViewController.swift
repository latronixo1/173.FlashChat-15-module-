//
//  ViewController.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 28.02.2025.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.textColor = UIColor(named: K.BrandColors.blue)
        element.font = .systemFont(ofSize: 50, weight: .black)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    //
    //

    let registerButton = UIButton(
        titleColor: UIColor(named: K.BrandColors.blue),
        backgroundColor: UIColor(named: K.BrandColors.lightBlue)
    )

    let logInButton = UIButton(
        titleColor: .white,
        backgroundColor: .systemTeal
    )
    
    // MARK: - Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setViews()
        setupConstraints()
        animationText()
    }

    // MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemYellow   //изменим цвет кнопки Back в navigationController

        view.addSubview(titleLabel)
        view.addSubview(logInButton)
        view.addSubview(registerButton)
        
        registerButton.setTitle(K.registerName, for: .normal)
        logInButton.setTitle(K.logInName, for: .normal)
        
        registerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)

    }
    
    //при помощи этой функции создается анимация набора текста "⚡️FlashChat"
    private func animationText() {
        titleLabel.text = ""
        let titleText = K.appName
        
        for letter in titleText.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(letter.offset), repeats: false) { _ in
                self.titleLabel.text! += String(letter.element)
            }
        }
    }
    
    @objc private func buttonsTapped (_ sender: UIButton) {
        let nextVC = RegisterViewController()
        
        if sender.currentTitle == K.registerName {
            nextVC.authorizationType = .register
        } else if sender.currentTitle == K.logInName {
            nextVC.authorizationType = .logIn 
        }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Setup Constraints
 
extension WelcomeViewController {
    
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        //начнем снизу. Кнопку logInButton прикрепим к нижней части экрана
        logInButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(K.Size.buttonSize)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        //а кнопку registerButton прикрепим к верхней части кнопки logInButton
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(K.Size.buttonSize)
            make.bottom.equalTo(logInButton.snp.top).offset(-K.Size.buttonOffset)
        }

         
    }
}

