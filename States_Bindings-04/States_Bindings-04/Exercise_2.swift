//
//  Exercise_2.swift
//  States_Bindings-04
//
//  Created by Esther Huecas on 21/10/21.
//

import SwiftUI

struct Exercise_2: View {
    
    @State private var clicksBtn1 = 0
    @State private var clicksBtn2 = 0
    @State private var clicksBtn3 = 0
    
    var body: some View {
        
        VStack {
            
            Text("\(clicksBtn1 + clicksBtn2 + clicksBtn3)")
                .font(.system(size: 100).bold())
            
            CounterView(numClicks: $clicksBtn1, buttonColor: .purple)
            CounterView(numClicks: $clicksBtn2, buttonColor: .blue)
            CounterView(numClicks: $clicksBtn3, buttonColor: .pink)
            
        }
    }
}

struct Exercise_2_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_2()
    }
}
