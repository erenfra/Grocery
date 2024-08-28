//
//  SignInViewModel.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/27/24.
//

import SwiftUI


@MainActor
final class SignInViewModel: ObservableObject {

  @Published var email = ""
  @Published var password = ""

  func signIn() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found")
      return
    }
    try await AuthenticationManager.shared.signInUser(email: email, password: password)

  }

}
