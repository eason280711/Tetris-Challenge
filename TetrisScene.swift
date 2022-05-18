//
//  GameScene.swift
//  sdfsg
//
//  Created by user219976 on 4/22/22.
//

import SpriteKit
import GameplayKit

extension UIImage {
    
    var isPortrait:  Bool    { return size.height > size.width }
    var isLandscape: Bool    { return size.width > size.height }
    var breadth:     CGFloat { return min(size.width, size.height) }
    var breadthSize: CGSize  { return CGSize(width: breadth, height: breadth) }
    var breadthRect: CGRect  { return CGRect(origin: .zero, size: breadthSize) }
    
    var circleMasked: UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(breadthSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        guard let cgImage = cgImage?.cropping(to: CGRect(origin:
            CGPoint(
                x: isLandscape ? floor((size.width - size.height) / 2) : 0,
                y: isPortrait  ? floor((size.height - size.width) / 2) : 0),
            size: breadthSize))
        else { return nil }
        
        UIBezierPath(roundedRect: breadthRect, cornerRadius: 50).addClip()
        UIImage(cgImage: cgImage, scale: 1, orientation: imageOrientation)
            .draw(in: breadthRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

// classic 'circleMasked' stackoverflow fragment
// courtesy Leo Dabius /a/29047372/294884
}

class TetrisScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?

    func CreateSK(path:String) -> SKSpriteNode{
        let sk = SKSpriteNode(imageNamed: path)
        sk.size = CGSize(width:screen.width,height: screen.height)
        sk.position = CGPoint(x: screen.width/2, y: screen.height/2)
        addChild(sk)
        return sk
    }

    func Create(path:String,x_offset:Int,y_offset:Int) -> SKSpriteNode{
        let sk = SKSpriteNode()
        sk.texture = SKTexture( image: UIImage(named: path)!.circleMasked! )
        sk.size = CGSize(width:25,height: 25)
        sk.position = CGPoint(x: screen.width/2 + CGFloat(x_offset) * 26, y: screen.height*1/3 + CGFloat(y_offset) * 26)
        addChild(sk)
        return sk
    }
    func TKI() {
        Create(path: "gradient_I",x_offset: -1,y_offset: 0)
        Create(path: "gradient_I",x_offset: 0,y_offset: 0)
        Create(path: "gradient_I",x_offset: 1,y_offset: 0)
        Create(path: "gradient_I",x_offset: 2,y_offset: 0)

        Create(path: "gradient_Z",x_offset: 0,y_offset: 1)
        Create(path: "gradient_Z",x_offset: 0,y_offset: 2)
        Create(path: "gradient_Z",x_offset: 1,y_offset: 1)
        Create(path: "gradient_Z",x_offset: -1,y_offset: 2)

        Create(path: "gradient_L",x_offset: -3,y_offset: 0)
        Create(path: "gradient_L",x_offset: -4,y_offset: 0)
        Create(path: "gradient_L",x_offset: -4,y_offset: 1)
        Create(path: "gradient_L",x_offset: -4,y_offset: 2)

        Create(path: "gradient_S",x_offset: 2,y_offset: 1)
        Create(path: "gradient_S",x_offset: 2,y_offset: 2)
        Create(path: "gradient_S",x_offset: 3,y_offset: 1)
        Create(path: "gradient_S",x_offset: 3,y_offset: 0)

        Create(path: "gradient_O",x_offset: 4,y_offset: 0)
        Create(path: "gradient_O",x_offset: 4,y_offset: 1)
        Create(path: "gradient_O",x_offset: 5,y_offset: 0)
        Create(path: "gradient_O",x_offset: 5,y_offset: 1)

        Create(path: "gradient_J",x_offset: 3,y_offset: 2)
        Create(path: "gradient_J",x_offset: 3,y_offset: 3)
        Create(path: "gradient_J",x_offset: 4,y_offset: 2)
        Create(path: "gradient_J",x_offset: 5,y_offset: 2)

        Create(path: "gradient_T",x_offset: -2,y_offset: 5)
        Create(path: "gradient_T",x_offset: -2,y_offset: 6)
        Create(path: "gradient_T",x_offset: -3,y_offset: 6)
        Create(path: "gradient_T",x_offset: -2,y_offset: 7)
    }
    override func didMove(to view: SKView) {
        
        CreateSK(path: "gradient")
        TKI()
    

        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.08)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.white
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.white
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.sequence([SKAction.fadeAlpha(to: 0, duration: 1),
                                              SKAction.fadeAlpha(to: 1, duration: 1)]))
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
