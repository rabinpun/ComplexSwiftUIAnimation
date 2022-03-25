//
//  Home.swift
//  Fluid Card Animation
//
//  Created by ebpearls on 25/03/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay {
                Text("Remember Words")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            
            LiquidCard(title: "Card One", subTitle: "subtitle one", detail: "detail one", description: "description one")
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension Home {
    
    @ViewBuilder
    private func LiquidCard(title: String, subTitle: String, detail: String, description: String, backgroundColor: Color = Color.blue) -> some View {
        ZStack {
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                HStack(spacing: 10) {
                    Image(systemName: "speaker.3")
                        .foregroundColor(.gray)
                    
                    Text(subTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 350)
            .background {
                GeometryReader { proxy in
                    let size = proxy.size
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(backgroundColor)
                    
                }
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
