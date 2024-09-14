//
//  SplashView.swift
//  Grocery
//
//  Created by Renato Oliveira Fraga on 8/29/24.
//

import SwiftUI

struct SplashView: View {
  var body: some View {
    ZStack {
      Color(Color.background)
        .ignoresSafeArea()
      VStack {
        Text("Shop Ledger")
          .foregroundStyle(Color.text)
          .font(.largeTitle.bold())
        Spacer()
        Image("Splash")
          .resizable()
          .scaledToFit()
          .frame(width: 300)
        Spacer()
        Text("v.1.0.0")
          .foregroundStyle(Color.text)
          .font(.footnote)
      }.padding()
    }
  }
}

#Preview {
  SplashView()
}
