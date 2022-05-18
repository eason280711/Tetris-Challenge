import SwiftUI

struct ButtonView: View {
    @Binding var showScene : Int
    var body: some View {
        ZStack{
            VStack{
                line.padding()
                Text("Challenge of Tetris")
                .font(.system(size: 40.0))
                .foregroundColor(.gray)
                line.padding()
            }
            .position(x:screen.width/2,y:screen.height*0.2)
            Button(action: {
                showScene *= -1
            }) {
                VStack{
                    
                    HStack{
                        line
                        Text("Start")
                        .font(.system(size: 40.0))
                        .foregroundColor(.gray)
                        line
                    }
                    Text("Clear Best In Two Minutes! GLHF!")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                }
            }
            .position(x:screen.width/2,y:screen.height*0.8)
            .opacity(0.6)
        }
    }

    var line: some View {
        VStack { Divider().background(.gray) }.padding(CGFloat(15))
    }
}