//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Ashkan Malekloo on 12/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VStack{
            pegs(colors: [.red,.blue,.yellow,.green])
            pegs(colors: [.red,.green,.yellow,.green])
            pegs(colors: [.yellow,.blue,.yellow,.blue])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack{
            ForEach(colors.indices, id: \.self){ index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
            
       }
    }
}





#Preview {
    ContentView()
    
    let numbers = [1,2,3,4]
    let x = numbers.map { number in
        number * 2
    }
    Text("\(x)")
}
