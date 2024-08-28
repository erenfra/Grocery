//
//  SettingsView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/27/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
      VStack {
        Text("Settings")
          .font(.largeTitle.bold())
        Button {

        } label: {
          Text("Reset Password")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        Button {

        } label: {
          Text("Delete Account")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
        }
        Spacer()
      }.padding()
    }
}

#Preview {
    SettingsView()
}
