//
//  GFSearchTextField.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 14.10.2025.
//

import UIKit

class GFSearchTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        self.placeholder = placeholderText
        configure()
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
}
