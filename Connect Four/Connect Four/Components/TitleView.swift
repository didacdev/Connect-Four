//
//  TitleView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct TitleView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Button {
                
                isDarkMode.toggle()
                
            } label: {
                Image(systemName: "moon.fill")
                    .padding()
                    .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                    .background(Color("ThemeIconColor"), in: RoundedRectangle(cornerRadius: 10))
            }
            Text("Connect Four")
                .font(.title)
            .fontWeight(.medium)
        }
    }
}

#Preview {
    TitleView()
}
