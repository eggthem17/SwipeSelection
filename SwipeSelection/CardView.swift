//
//  CardView.swift
//  SwipeSelection
//
//  Created by MinKyu CHA on 5/3/24.
//

import SwiftUI

struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(color.opacity(0.9))
                .strokeBorder(Color.primary, lineWidth: 6)
                .shadow(radius: 4)
                .frame(width: 320, height: 420)
            
            HStack {
                Text(person)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .bold()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded{ _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }
}

#Preview {
    CardView(person: "Mario")
}

extension CardView {
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(person) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(person) removed")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .black
        }
    }
}
