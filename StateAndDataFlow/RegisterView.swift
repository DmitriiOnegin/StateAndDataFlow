//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @AppStorage("username") var username: String = ""
    
    var isValid: Bool {
        name.count > 2 ? true : false
    }
    
    var body: some View {
        VStack {
            Text(username)
            HStack{
                Spacer()
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(isValid ? .green : .red)
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(!isValid)
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            username = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
