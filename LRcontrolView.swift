import SwiftUI

struct LRcontrolView: View {
    @Binding var dire : Int
    var body: some View {
        HStack{
            Button(action: { 
                dire = -1
            }, label: {
                Image(systemName: "arrow.left")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.6))
            })
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

            Button(action: { 
                dire = 1
            }, label: {
                Image(systemName: "arrow.right")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.6))
            })
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

            Spacer()
            .frame(width: screen.width/4)

            Button(action: { 
                dire = -2
            }, label: {
                Image(systemName: "arrow.counterclockwise")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.6))
            })
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

            Button(action: { 
                dire = 2
            }, label: {
                Image(systemName: "arrow.clockwise")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.6))
            })
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)

        }
        .position(x:screen.width/2,y:screen.height*0.8)
    }
}