//
//  RegistrationViewModel.swift
//  Sign-12
//
//  Created by Esther Huecas on 7/1/22.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    
    //Entrada datos del usuario
    @Published var userName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    //Valores de validación del formulario
    @Published var isUserNameLengthValid = false
    @Published var isPasswordLenghtValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordsMatch = false
    
    private var cancellableObjects: Set<AnyCancellable> = []
    
    init() {
        $userName
            .receive(on: RunLoop.main)
            .map { userName in
                return userName.count >= 6
            }
            .assign(to: \.isUserNameLengthValid, on: self)
            .store(in: &cancellableObjects) //almacenar los emisores --> username
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLenghtValid, on: self)
            .store(in: &cancellableObjects) //almacenar los emisores --> password
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]" //Expresion regular que contiene mayusculas
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableObjects) //almacenar los emisores --> password mayus
        
        
        Publishers.CombineLatest($password, $confirmPassword)
            .receive(on: RunLoop.main)
            .map { (password, confirmPassword) in
                return !password.isEmpty && (password == confirmPassword)
            }
            .assign(to: \.isPasswordsMatch, on: self)
            .store(in: &cancellableObjects) //almacenar los emisores --> confirmpass
        
        
    }
}
