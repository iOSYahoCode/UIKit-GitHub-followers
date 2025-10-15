//
//  SearchVC.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 14.10.2025.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextFieldWithLabel(placeholderText: "Enter username", descriptionLabelText: "Username:")
    let callToCationButton = GFButton(backgroundColor: .systemIndigo, title: "Get followers!")
    let userNameTitleLabel = GFBodyLabel(textAlignment: .left)

    var isUsernameEntered: Bool {
        guard let saveUserName = usernameTextField.text else {return false}
        return !saveUserName.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createDesmissKeyboardTapGesture()
        configureLogoIV()
        configureSearcTF()
        configureToActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(
                alertTitle: "Username is empty!",
                message: "Please, write username to input field and try again",
                buttonTitle: "Return")
            return
        }
        
        let followerListVC = FollowersListVC()
        followerListVC.userName = usernameTextField.text!
        followerListVC.title = usernameTextField.text!
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func createDesmissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureLogoIV() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    
    private func configureSearcTF() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureToActionButton() {
        view.addSubview(callToCationButton)
        callToCationButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToCationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToCationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToCationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToCationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollowerListVC()
        return true
    }
}
