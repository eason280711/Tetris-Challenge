import SwiftUI

struct backView: View {
    @Binding var showScene : Int
    var body: some View {
        ZStack{
            Button(action: { 
                showScene *= -1
            }, label: {
                Image(systemName: "arrow.turn.up.left")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.6))
            })
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            .position(x:screen.width*0.1,y:screen.height*0.1)
        }
    }
}