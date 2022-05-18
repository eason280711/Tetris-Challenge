import SwiftUI

struct TitleView: View {
    var body: some View {
        ZStack{
            Image("gradient")
                .resizable()
                .frame(width: screen.width, height: screen.height)
        }
    }
}