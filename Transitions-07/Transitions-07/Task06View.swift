//
//  Task06View.swift
//  Transitions-07
//
//  Created by Esther Huecas on 10/11/21.
//

import SwiftUI


struct Task06View: View {
    
    @State private var step = 0
    
    var body: some View {
        
        switch self.step {
        case 0:
            PayView(payStep: self.$step)
                .transition(.opacity)
        case 1:
            LoadingView(loadingStep: self.$step)
                .transition(.opacity)
        case 2:
            SuccessPaymentView(successStep: self.$step)
                .transition(.opacity)
        default:
            PayView(payStep: self.$step)
        }
    }
}

struct Task06View_Previews: PreviewProvider {
    static var previews: some View {
        Task06View()
    }
}

struct PayView: View {
    
    @Binding var payStep: Int
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 250, height: 70)
                .foregroundColor(.black)
                .overlay(
                    HStack {
                        Image(systemName: "applelogo")
                            .font(.system(.largeTitle))
                        Text("Pay")
                            .font(.system(.largeTitle, design: .rounded).bold())
                    }
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(.linear) {
                        self.payStep = 1
                    }
                }
        }
    }
}

struct LoadingView: View {
    
    @Binding var loadingStep: Int
    @State private var progress: CGFloat = 0.0
    @State private var isLoading = false
    
    var body: some View {
        
        ZStack {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 80, height: 90)
                .offset(x: 0, y: -100)
                .foregroundColor(.gray)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(.systemGray6), lineWidth: 10)
                    .frame(width: 300, height: 10)
                
                RoundedRectangle(cornerRadius: 2)
                    .stroke(isLoading ? .black : .gray, lineWidth: 10)
                    .frame(width: progress*300, height: 8)
                
                    
                
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    self.progress += 0.01
                    if self.progress >= 1 {
                        self.isLoading = true
                        timer.invalidate()
                        
                        self.loadingStep = 2
                    }
                }
            }
        }
    }
}


struct SuccessPaymentView: View {
    
    @Binding var successStep: Int
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            
            Text("Pago realizado con éxito")
                .font(.system(.largeTitle, design: .rounded).bold())
                .foregroundColor(.black)
            Spacer()
                       
            ZStack {
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width: 200, height: 200)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(.green, lineWidth: 13)
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle.degrees(-120))
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                    self.progress += 0.01
                    if self.progress >= 1 {
                        self.isLoading.toggle()
                        timer.invalidate()
                    }
                }
            }
            
            Spacer()
            
            if self.isLoading {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: 400, height: 70)
                    .transition(.offsetScaledOpacityOut)
                
                    .overlay(
                        HStack {
                            Image(systemName: "hand.tap.fill")
                                .font(.system(.largeTitle))
                                .padding()
                            Text("Volver a hacer un pago")
                                .font(.system(.body, design: .rounded).bold())
                        }).foregroundColor(.white)
                
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.successStep = 0
                        }
                    }
            }
        }
        .padding()
    }
}

