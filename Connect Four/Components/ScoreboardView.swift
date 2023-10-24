//
//  ScoreboardView.swift
//  Connect Four
//
//  Created by Diego Sánchez on 24/10/23.
//

import SwiftUI

struct ScoreboardView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Red")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("0")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .background(Color(red: 0.693, green: 0.2, blue: 0.263), in: RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text("Yellow")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("0")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .background(Color(red: 0.682, green: 0.638, blue: 0.345), in: RoundedRectangle(cornerRadius: 10))
        }
        .padding()
        .background(Color(red: 0.196, green: 0.305, blue: 0.488), in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color(red: 0.196, green: 0.305, blue: 0.488), radius: 2)
        
        
    }
}

#Preview {
    ScoreboardView()
}
