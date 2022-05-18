import SwiftUI
import SpriteKit
let screen = UIScreen.main.bounds
struct ContentView: View {
    @State var showScene : Int = -1
    @State var dire : Int = 0
    @State var score:Int = 0

    var scene : SKScene {
        let scene = GameScene($dire,$showScene,$score)
        scene.size = CGSize(width: screen.width, height: screen.height)
        return scene
    }

    var Tetrisscene : SKScene {
        let scene = TetrisScene()
        scene.size = CGSize(width: screen.width, height: screen.height)
        return scene
    }
    
    var body: some View{
            ZStack{
                TitleView()
                .ignoresSafeArea()
                if showScene == 1{
                    SpriteView(scene: scene,options: [.allowsTransparency])
                    .frame(width: screen.width*0.88, height: screen.height*0.88)
                    .ignoresSafeArea()
                    LRcontrolView(dire:$dire)
                    backView(showScene:$showScene)
                }
                if showScene == -1{
                    SpriteView(scene: Tetrisscene,options: [.allowsTransparency])
                    .frame(width: screen.width, height: screen.height)
                    .ignoresSafeArea()
                    ButtonView(showScene:$showScene)
                }
                if showScene == 0{
                    SpriteView(scene: Tetrisscene,options: [.allowsTransparency])
                    .frame(width: screen.width, height: screen.height)
                    .ignoresSafeArea()
                    scoreView(showScene:$showScene,score:$score)
                }
            }
    }
}
