//
//  LoginView.swift
//  login-app-ios
//
//  Created by Gabriel Castelo De Azeredo Coutinho on 16/10/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .center) {
                    Image("logo-stone", bundle: nil)
                        .frame(width: proxy.size.width - 60, height: 40)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("E-mail ou CPF")
                    TextField("Digite seu e-mail ou CPF", text: .constant(""))
                        .padding(.all, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.stoneButtonBorder, lineWidth: 0.2)
                        }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Senha")
                    TextField("Digite sua senha", text: .constant(""))
                        .padding(.all, 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.stoneButtonBorder, lineWidth: 0.2)
                        }
                }
                Button("Esqueci minha senha >", action: {})
                    .buttonStyle(SPlainLinkButton())
                Button("Entrar", action: {})
                    .frame(width: proxy.size.width - 60)
                    .padding(.vertical, 10)
                    .foregroundStyle(Color.white)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(Color.green)
                    }
            }
            .padding(.horizontal, 15)
            .frame(
                width: proxy.size.width - 30,
                height: 350,
                alignment: .center
            )
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
            }
            .position(CGPoint(
                x: proxy.frame(in: .global).midX,
                y: proxy.frame(in: .global).midY
            ))
            HStack {
                Text("Ainda não é stone?")
                Button("Seja stone! >", action: {})
                    .buttonStyle(SPlainLinkButton())
            }
            .position(CGPoint(
                x: proxy.frame(in: .global).midX,
                y: proxy.frame(in: .global).midY + 195
            ))
        }
        .background {
            Color.gray.opacity(0.1)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    LoginView()
}
