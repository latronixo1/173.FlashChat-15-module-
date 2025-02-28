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
    }
}

// MARK: - Setup Constraints
 
extension WelcomeViewController {
    
    private func setupConstraints() {
        
    }
}
