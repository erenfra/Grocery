//
//  AuthenticationManager.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
  let uid: String
  let email: String?

  init(user: User) {
    self.uid = user.uid
    self.email = user.email
  }
}

final class AuthenticationManager {

  static var shared = AuthenticationManager()
  private init() { }

  func getAuthenticatedUser() throws -> AuthDataResultModel {
    guard let user = Auth.auth().currentUser else {
      throw URLError(.badServerResponse)
    }

    return AuthDataResultModel(user: user)
  }

  @discardableResult
  func createUser(email: String, password: String) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
    return AuthDataResultModel(user: authDataResult.user)
  }

  @discardableResult
  func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
    return AuthDataResultModel(user: authDataResult.user)
  }

  func resetPassword(email: String) async throws {
    try await Auth.auth().sendPasswordReset(withEmail: email)
  }
  func signOut() throws {
    try Auth.auth().signOut()
  }

  func deleteUser() async throws {
    guard let user = Auth.auth().currentUser else {
      throw URLError(.badURL)
    }
    try await user.delete()
  }

}
