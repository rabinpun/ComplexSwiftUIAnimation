//
//  Home.swift
//  Fluid Card Animation
//
//  Created by ebpearls on 25/03/2022.
//

import SwiftUI

struct Home: View {
    
    @State var expandCard = false
    
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
            
            LiquidCard(title: "Card One", subTitle: "subtitle one", detail: "detail one", description: "description one") {
                // toggle card animation
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    expandCard.toggle()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

extension Home {
    
    @ViewBuilder
    private func LiquidCard(title: String, subTitle: String, detail: String, description: String, backgroundColor: Color = Color.blue, onExpand: @escaping () -> Void ) -> some View {
        ZStack {
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                HStack(spacing: 10) {
                    Image(systemName: "speaker.3")
                        .foregroundColor(.white)
                    
                    Text(subTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: expandCard ? 350 : 250)
            .background {
                GeometryReader { proxy in
                    let size = proxy.size
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(backgroundColor)
                    
                }
            }
            // MARK: Overlayed Expand Button
            .overlay(alignment: .bottom) {
                Button {
                    onExpand()
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.title3.bold())
                        .foregroundColor(backgroundColor)
                        .padding(30)
                        .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous ))
                }
                .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: 5)
                .padding(.bottom, -25)
            }
            .zIndex(1)
            
            // MARK: Expanded Card
            VStack(spacing: 20) {
                Text(detail)
                    .font(.largeTitle.bold())
                
                Text(description)
                    .font(.title3)
                    .lineLimit(3)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 40)
            .frame(maxWidth: .infinity)
            .background {
                GeometryReader { proxy in
                    let size = proxy.size
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(backgroundColor)
                }
            }
            .zIndex(0)
            .offset(y: expandCard ? 0 : 250)
            
        }
        .offset(y: expandCard ? 0 : -50)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
