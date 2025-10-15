//
//  GFTextFieldWithLabel.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 15.10.2025.
//

import UIKit

class GFTextFieldWithLabel: GFTextField {
    
    let descriptionLabel = GFBodyLabel(textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDescriptionLabel()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(placeholderText: String) {
        super.init(placeholderText: placeholderText)
        configureDescriptionLabel()
    }
    
    init(placeholderText: String, descriptionLabelText: String) {
        super.init(placeholderText: placeholderText)
        self.descriptionLabel.text = descriptionLabelText
        configureDescriptionLabel()
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
