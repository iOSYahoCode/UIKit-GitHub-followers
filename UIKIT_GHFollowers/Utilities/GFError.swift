//
//  GFError.swift
//  UIKIT_GHFollowers
//
//  Created by Yaroslaw Homziak on 15.10.2025.
//

import Foundation

enum GFError: String, Error {
    case invalidUserName = "This username created an invalide request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalide response from the server. Please try again"
    case invalidData = "The data recived from the server was invalid. Please try again"
}
