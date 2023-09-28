//
//  CardView.swift
//  Developers
//
//  Created by solinx on 28/09/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PPRPERTIES
    var card: Card
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: - Card
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ?  1.0 : 0.0 )
            
            VStack{
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }.offset(y: moveDownward ? -218 : -300)
            
            Button {
               playSound(soundName: "sound-chime", type: "mp3")
                
                self.showAlert.toggle()
                self.hapticImpact.impactOccurred()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    .tint(Color.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .tint(Color.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y:3)
            }
            .offset(y: moveUpward ? 210 : 300)

        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            
            
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            
            
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
            
        
        }
        .alert( isPresented: $showAlert) {
            SwiftUI.Alert(
                title: Text(card.title),
                message: Text(card.message)
                ,dismissButton: .default(Text("dismiss"))
            )
        }
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView( card: cardData[2])
            .previewLayout(.sizeThatFits)
    }
}
