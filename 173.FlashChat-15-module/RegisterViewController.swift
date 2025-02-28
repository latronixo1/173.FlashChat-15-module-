//
//  RegisterViewController.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 01.03.2025.
//

import UIKit
import SnapKit

enum AuthorizationType: String {
    case register = "Register"
    case logIn = "Log In"
}

class RegisterViewController: UIViewController {

    // MARK: - UI
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let emailTextField = UITextField(
        placeholder: K.emailName,
        color: UIColor(named: K.BrandColors.blue)
        )
    
    let passwordTextField = UITextField(
        placeholder: K.passwordName,
        color: .black
        )
    
    let registerButton = UIButton(titleColor: UIColor(named: K.BrandColors.blue))
    
    // MARK: - Public Properties
    
    //родильтельский вьюконтроллер передаст в эту переменную - регистрация или авторизация будет в данном окне?
    public var authorizationType: AuthorizationType?
    
    private lazy var imageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: K.textFieldImageName)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Life Cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setViews()
        setupConstraints()
    }

    // MARK: - Set Views
    
    private func setViews() {
        switch authorizationType {
        case .register:
            view.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
            registerButton.setTitle(K.registerName, for: .normal)
        case .logIn:
            view.backgroundColor = UIColor(named: K.BrandColors.blue)
            registerButton.setTitle(K.logInName, for: .normal)
            registerButton.setTitleColor(.white, for: .normal)
            
            emailTextField.text = "1@1.com"
        case nil:
            break
        }
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(imageView)
        imageView.addSubview(passwordTextField)
        mainStackView.addArrangedSubview(registerButton)
        
        emailTextField.makeShadow()
    }
    
    @objc private func buttonsTapped (_ sender: UIButton) {
//        if sender.
    }
}

// MARK: - Setup Constraints
 
extension RegisterViewController {
    
    private func setupConstraints() {
        mainStackView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints{ make in
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(36)
        }
        
        imageView.snp.makeConstraints{ make in
            make.height.equalTo(137)
            make.leading.trailing.equalTo(view)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(30)
//            make.bottom.equalToSuperview().offset(-62)
            make.leading.trailing.equalToSuperview().inset(48)
            make.height.equalTo(45)
        }

        
         
    }
}

//расширение для кнопки Email. Кнопка - наследник UIControl, а он - UIView. Оно добавляет к кнопке функцию makeShadow, которая позволит легко сделать тень любой кнопке
extension UIView {
    func makeShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 10
    }
}

extension UITextField {
    convenience init(placeholder: String, color: UIColor?) {
        self.init()
        self.placeholder = placeholder
        self.textAlignment = .center
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        self.font = .systemFont(ofSize: 25)
        self.textColor = color
        self.tintColor = color
    }
}
