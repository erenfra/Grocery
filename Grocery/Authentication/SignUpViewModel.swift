//
//  SignInViewModel.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI

@MainActor
final class SignUpViewModel: ObservableObject {

  @Published var email = ""
  @Published var password = ""

  func signUp() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found")
      return
    }
    try await AuthenticationManager.shared.createUser(email: email, password: password)

  }

}



