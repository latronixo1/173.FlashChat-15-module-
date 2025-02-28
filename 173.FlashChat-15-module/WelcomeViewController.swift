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
    }

    // MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(logInButton)
        view.addSubview(registerButton)
        
        titleLabel.text = K.appName
        registerButton.setTitle(K.registerName, for: .normal)
        logInButton.setTitle(K.logInName, for: .normal)
        
        registerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)

    }
    
    @objc private func buttonsTapped (_ sender: UIButton) {
        let nextVC = RegisterViewController()
        
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

extension UIButton {

    convenience init(titleColor: UIColor?, backgroundColor: UIColor? = .clear) {
        self.init(type: .system)
        self.titleLabel?.font = .systemFont(ofSize: 30)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
