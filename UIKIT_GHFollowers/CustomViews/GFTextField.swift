//
//  GFSearchTextField.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 14.10.2025.
//

import UIKit

class GFTextField: UITextField {
    
    let descriptionLabel = GFBodyLabel(textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholderText: String, labelText: String) {
        super.init(frame: .zero)
        self.placeholder = placeholderText
        self.descriptionLabel.text = labelText
        
        configure()
        configureDescriptionLabel()
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray3.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title3)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        returnKeyType = .go
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
    }
    
    private func configureDescriptionLabel() {
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: self.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
