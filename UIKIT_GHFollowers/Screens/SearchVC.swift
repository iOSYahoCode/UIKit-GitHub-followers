//
//  SearchVC.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 14.10.2025.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextFieldWithLabel(
        placeholderText: "Enter username",
        descriptionLabelText: "Username:")
    
    let callToAtionButton = GFButton(backgroundColor: .systemIndigo, title: "Get followers!")
    let userNameTitleLabel = GFBodyLabel(textAlignment: .left)

    var isUsernameEntered: Bool {
        guard let userName = usernameTextField.text else { return false }
        return !userName.isEmpty
    }
    
    //MARK: ViewController's functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayoutUI()
        createDismissKeyboardTapGesture()
        configureLogoIV()
        configureToActionButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Actions
    
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
        usernameTextField.text = nil
    }
    
    //MARK: UI configuration
    
    private func configureLayoutUI() {
        let elements: [UIView] = [logoImageView, usernameTextField, callToAtionButton]
        elements.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            callToAtionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToAtionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToAtionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToAtionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func configureLogoIV() {
        logoImageView.image = UIImage(named: ImageAsset.githubLogo)!
    }
    
    private func configureToActionButton() {
        callToAtionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
    }
}

//MARK: Extensions

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pushFollowerListVC()
        return true
    }
}
