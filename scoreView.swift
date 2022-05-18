import SwiftUI

struct scoreView: View {
    @Binding var showScene : Int
    @Binding var score : Int
    var body: some View {
        ZStack{
            VStack{
                Text("Your Score")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                HStack{
                    line
                    Text(String(score))
                    .font(.system(size: 80.0))
                    .foregroundColor(.black)
                    line
                }
            }
            .position(x:screen.width/2,y:screen.height*0.25)
            Button(action: {
                showScene += -1
            }) {
                VStack{
                    
                    HStack{
                        
                        Text("Back")
                        .font(.system(size: 40.0))
                        .foregroundColor(.gray)
                    }
                    Text("Good Games GGS!")
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