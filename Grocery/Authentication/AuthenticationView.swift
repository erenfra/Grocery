//
//  AuthenticationView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/26/24.
//

import SwiftUI

struct AuthenticationView: View {
  @Binding var showAuthenticationView: Bool
  var body: some View {
    VStack{
      NavigationLink {
        SignInView(showAuthenticationView: $showAuthenticationView)
      } label: {
        Text("Sign In")
          .font(.headline)
          .foregroundStyle(Color.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
      }
      Spacer()
      VStack {
        Text("Don't have an account yet?")
        NavigationLink {
          SignUpView(showAuthenticationView: $showAuthenticationView)
        } label: {
          Text("Sign Up")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
      }

    }.padding(.vertical, 50)
      .padding()
    .navigationTitle("Welcome to Grocery")
  }
}

#Preview {
  NavigationStack {
    AuthenticationView(showAuthenticationView: .constant(false))
  }
}
