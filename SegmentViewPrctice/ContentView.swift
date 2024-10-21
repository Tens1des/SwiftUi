//
//  ContentView.swift
//  SegmentViewPrctice
//
//  Created by Роман  on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0
    var company = ["Nike", "Puma", "Reebok"]
    var sneakers = ["nike", "puma", "reebok"]
    
    
    var body: some View {
        
        VStack {
            Text("Boots - \(company[segmentIndex])").font(Font.system(.title))
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .padding().offset(x:CGFloat(offsetX))
                
                Image(sneakers[segmentIndex]).resizable()
                    .frame(width: 400, height: 400)
            }.animation(.spring())
            Picker(selection: Binding(get: {
                self.segmentIndex
            }, set: { (newValue) in
                self.segmentIndex = newValue
                self.offsetX = -500
                self.moveBack()
            }), label: Text(" ")) {
                ForEach(0..<company.count){
                    Text(self.company[$0]).tag($0)
                }
                
            }.pickerStyle(SegmentedPickerStyle()).padding()
            Spacer().frame(height: 150)
        }
    }
    private func moveBack () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.offsetX = 0
        }
    }
}

#Preview {
    ContentView()
}

