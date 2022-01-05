//
//  ContentView.swift
//  Sign-12
//
//  Created by Esther Huecas on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            Text("Crea una cuenta")
                .font(.system(.largeTitle, design: .rounded).bold())
                .padding(.bottom, 50)
            
            SignFormView(fieldName: "Nombre", fieldValue: $username)
            
            ValidationFormView(formText: "Mínimo 6 carácteres")
                .padding()
            
            SignFormView(fieldName: "Contraseña", isProtected: true, fieldValue: $password)
            
            VStack {
                ValidationFormView(formText: "Mínimo 8 carácteres", isConditionField: false)
                ValidationFormView(formText: "Se necesita mayúsculas y números", isConditionField: false)
            }.padding()
            
            SignFormView(fieldName: "Confirmar contraseña", isProtected: true, fieldValue: $confirmPassword)
            
            ValidationFormView(formText: "Las dos contraseñas deben coincidir", isConditionField: false)
                .padding()
                .padding(.bottom, 60)
            
            Button(action: {
                
            }) {
                Text("Registrarse")
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
            }
            
            HStack {
                Text("¿Ya tienes una cuenta?")
                    .font(.system(.body, design: .rounded))
                Button(action: {
                    
                }) {
                    Text("Iniciar sesión")
                        .font(.system(.headline))
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SignFormView: View {
    
    var fieldName = ""
    var isProtected = false
    @Binding var fieldValue: String
    
    var body: some View {
        if isProtected {
            SecureField(fieldName, text: $fieldValue)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
        } else {
            TextField(fieldName, text: $fieldValue)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
        }
        Divider()
            .frame(height: 1)
            .background(Color.gray)
            .padding(.horizontal)
    }
}

struct ValidationFormView: View {
    
    var iconName = "xmark.circle"
    var iconColor = Color.red
    var formText = ""
    var isConditionField = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(formText)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.gray)
                .strikethrough(isConditionField)
            Spacer()
        }
    }
}
