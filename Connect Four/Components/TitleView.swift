//
//  TitleView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "moon.fill")
                    .padding()
                    .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0))
                    .background(Color(red: 0.93, green: 0.95, blue: 0.971), in: RoundedRectangle(cornerRadius: 10))
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
