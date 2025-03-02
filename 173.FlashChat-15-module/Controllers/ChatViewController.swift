//
//  ChatViewController.swift
//  173.FlashChat-15-module
//
//  Created by Валентин Картошкин on 02.03.2025.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: - UI
    
    private let tableView = UITableView()
    
    private lazy var containerView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = .white
        element.borderStyle = .roundedRect
        element.placeholder = K.enterMessagePlaceholder
        element.textColor = UIColor(named: K.BrandColors.purple)
        element.tintColor = UIColor(named: K.BrandColors.purple)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var enterButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: K.enterButtonImageName), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Private Properties
    
    let messages = Message.getMessages()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setViews()
        setupConstraints()
        setDelegates()
    }
    
    // MARK: - Set Views
    
    private func setViews() {
        view.backgroundColor = UIColor(named: K.BrandColors.purple)

        //заголовок внутри navigationController
        title = K.appName
        navigationController?.navigationBar.barTintColor = UIColor(named: K.BrandColors.blue)
        
        
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: K.cellIdentifier)
        view.addSubview(tableView)
        view.addSubview(containerView)
        containerView.addSubview(messageTextField)
        containerView.addSubview(enterButton)
    }
    
    //создаем свзь ChatViewController c tableView (чтобы получать от tableView данные)
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count    //количество ячеек в таблице
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        //indexPath - номер секции и номер ячейки. row - номер ячейки, section - номер секции
        let model = messages[indexPath.row]
        cell.textLabel?.text = model.body
        
        return cell
    }
}

// MARK: - SeupConstraints

extension ChatViewController {
    
    private func setupConstraints () {
        tableView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints{ make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
            make.top.equalTo(tableView.snp.bottom)
        }
        
        messageTextField.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(20)
        }
        
        enterButton.snp.makeConstraints{ make in
            make.top.trailing.equalToSuperview().inset(20)
            make.leading.equalTo(messageTextField.snp.trailing).offset(20)
            make.height.width.equalTo(40)
        }

    }
    
}
