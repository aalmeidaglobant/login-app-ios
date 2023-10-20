//
//  LoginView.swift
//  login-app-ios
//
//  Created by Gabriel Castelo De Azeredo Coutinho on 16/10/23.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewModel()
    
    var body: some View {
        if viewModel.state != .success {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    CentralizedLogo()
                        .padding(.top, 10)
                    if viewModel.state == .failure {
                        Text("Usuário ou senha incorretos!")
                            .foregroundStyle(.red)
                    }
                    UsernameField(username: $viewModel.username)
                    PasswordField(password: $viewModel.password)
                    Link("Esqueci minha senha >", destination: URL(string: "https://conta.stone.com.br/nao-consigo-entrar")!)
                        .buttonStyle(SPlainLinkButton())
                    EntrarButton {
                       Task { await viewModel.verify() }
                    }
                }
                .padding(.all, 15)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 15)
                HStack {
                    Text("Ainda não é stone?")
                    Link("Seja stone! >", destination: URL(string: "https://www.stone.com.br/adquira/")!)
                        .buttonStyle(SPlainLinkButton())
                }
                Spacer()
            }
            .background {
                Color.gray.opacity(0.1)
            }
            .overlay {
                if viewModel.state == .loading {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                        Spacer()
                    }
                    .background {
                        Color.gray.opacity(0.5)
                    }
                }
            }
            .ignoresSafeArea(.all)
        } else {
            LoggedView()
        }
    }
}


fileprivate struct EntrarButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Entrar", action: action)
        .padding(.vertical, 10)
        .frame(minWidth: 1, maxWidth: .infinity)
        .foregroundStyle(Color.white)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.green)
        }
    }
}

fileprivate struct CentralizedLogo: View {
    var body: some View {
        HStack {
            Spacer()
            Image("logo-stone", bundle: nil)
            Spacer()
        }
    }
}
fileprivate struct UsernameField: View {
    @Binding var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("E-mail ou CPF")
            TextField("Digite seu e-mail ou CPF", text: $username)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.all, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.stoneButtonBorder, lineWidth: 0.2)
                }
        }
    }
}

fileprivate struct PasswordField: View {
    @Binding var password: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Senha")
            SecureField("Digite sua senha", text: $password)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.all, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.stoneButtonBorder, lineWidth: 0.2)
                }
        }
    }
}

#Preview {
    LoginView()
}
