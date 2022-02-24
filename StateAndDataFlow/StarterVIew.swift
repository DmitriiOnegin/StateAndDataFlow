//
//  StarterVIew.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct StarterVIew: View {
    @EnvironmentObject var user: UserManager
    @AppStorage("username") var username: String = ""
   
    var body: some View {
        Group {
            if user.isRegister {
                ContentView()
            } else {
                RegisterView()
            }
        }
        .onAppear {
            if !username.isEmpty {
                user.isRegister = true
                user.name = username
            }
        }
    }
}

struct StarterVIew_Previews: PreviewProvider {
    static var previews: some View {
        StarterVIew()
            .environmentObject(UserManager())
    }
}
