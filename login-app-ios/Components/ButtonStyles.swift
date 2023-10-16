//
//  ButtonStyles.swift
//  login-app-ios
//
//  Created by Gabriel Castelo De Azeredo Coutinho on 16/10/23.
//

import SwiftUI

struct SPrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                Capsule()
                    .foregroundStyle(Color.stoneGreen)
            }
    }
}

struct SLoginButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.stoneGreen)
            }
    }
}

struct SPlainLinkButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.green)
    }
}

struct SSecondaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background {
                Capsule()
                    .stroke(Color.stoneButtonBorder, lineWidth: 1.0)
            }
    }
}

struct SPlainButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundStyle(.black)
            .fontWeight(.semibold)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
    }
}

#Preview {
    VStack {
        Button("SPrimaryButton", action: {})
            .buttonStyle(SPrimaryButton())
        Button("SPlainButton", action: {})
            .buttonStyle(SPlainButton())
        Button("SSecondaryButton", action: {})
            .buttonStyle(SSecondaryButton())
        Button("SLoginButton", action: {})
            .buttonStyle(SLoginButton())
        Button("SPlainLinkButton", action: {})
            .buttonStyle(SPlainLinkButton())
    }
}
