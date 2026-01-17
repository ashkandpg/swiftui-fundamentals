//
//  PegView.swift
//  CodeBreaker
//
//  Created by Ashkan Malekloo on 1/2/26.
//

import SwiftUI

struct PegView: View {
    
    // MARK: Data In
    let peg: Peg
    
    // MARK: - Body
    let pegShape = Circle()
    
    var body: some View {
        
        pegShape
            .contentShape(Rectangle())
            .overlay{
                if peg == Code.missingPeg {
                    pegShape
                        .strokeBorder(.gray)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(peg)
        
    }
}



#Preview{
    PegView(peg: .blue)
        .padding()
    
}
