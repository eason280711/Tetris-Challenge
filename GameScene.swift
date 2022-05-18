//
//  GameScene.swift
//  sdfsg
//
//  Created by user219976 on 4/22/22.
//

import SpriteKit
import GameplayKit
import SwiftUI

struct TetrisGameBlock {
    var blockType: BlockType
}

enum BlockType: CaseIterable {
    case i, t, o, j, l, s, z
}

func getColor(blockType: BlockType?) -> String{
    switch blockType{
        case .i:
            return "gradient_I"
        case .t:
            return "gradient_T"
        case .o:
            return "gradient_O"
        case .j:
            return "gradient_J"
        case .l:
            return "gradient_L"
        case .s:
            return "gradient_S"
        case .z:
            return "gradient_Z"
        case .none:
            return "gradient_N"
    }
}

struct BlockLocation{
    var row : Int
    var column : Int
}

func getWallKick(cur:Int,to:Int) -> [BlockLocation]{
    if cur == 0 && to == 1{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -1),BlockLocation(row: -1, column: -1),BlockLocation(row: 2, column: 0),BlockLocation(row: 2, column: -1)]
    }
    if cur == 1 && to == 0{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: 1, column: 1),BlockLocation(row: -2, column: 0),BlockLocation(row: -2, column: 1)]
    }
    if cur == 1 && to == 2{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: 1, column: 1),BlockLocation(row: -2, column: 0),BlockLocation(row: -2, column: 1)]
    }
    if cur == 2 && to == 1{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -1),BlockLocation(row: -1, column: -1),BlockLocation(row: 2, column: 0),BlockLocation(row: 2, column: -1)]
    }
    if cur == 2 && to == 3{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: -1, column: 1),BlockLocation(row: 2, column: 0),BlockLocation(row: 2, column: 1)]
    }
    if cur == 3 && to == 2{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -1),BlockLocation(row: 1, column: -1),BlockLocation(row: -2, column: 0),BlockLocation(row: -2, column: -1)]
    }
    if cur == 3 && to == 0{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 1, column: 0),BlockLocation(row: 1, column: -1),BlockLocation(row: -2, column: 0),BlockLocation(row: -2, column: 1)]
    }
    if cur == 0 && to == 3{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: -1, column: 1),BlockLocation(row: 2, column: 0),BlockLocation(row: 2, column: 1)]
    }
    return []
}

func getWallKickIO(cur:Int,to:Int) -> [BlockLocation]{
    if cur == 0 && to == 1{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -2),BlockLocation(row: 0, column: 1),BlockLocation(row: 1, column: -2),BlockLocation(row: -2, column: 1)]
    }
    if cur == 1 && to == 0{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 2),BlockLocation(row: 0, column: -1),BlockLocation(row: -1, column: 2),BlockLocation(row: 2, column: -1)]
    }
    if cur == 1 && to == 2{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -1),BlockLocation(row: 0, column: 2),BlockLocation(row: -2, column: -1),BlockLocation(row: 1, column: 2)]
    }
    if cur == 2 && to == 1{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: 0, column: -2),BlockLocation(row: 2, column: 1),BlockLocation(row: -1, column: 2)]
    }
    if cur == 2 && to == 3{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 2),BlockLocation(row: 0, column: -1),BlockLocation(row: -1, column: 2),BlockLocation(row: 2, column: -1)]
    }
    if cur == 3 && to == 2{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -2),BlockLocation(row: 0, column: 1),BlockLocation(row: 1, column: -2),BlockLocation(row: -2, column: 1)]
    }
    if cur == 3 && to == 0{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: 1),BlockLocation(row: 0, column: -2),BlockLocation(row: 2, column: -1),BlockLocation(row: -1, column: 2)]
    }
    if cur == 0 && to == 3{
        return [BlockLocation(row: 0, column: 0),BlockLocation(row: 0, column: -1),BlockLocation(row: 0, column: 2),BlockLocation(row: -2, column: -1),BlockLocation(row: 1, column: 2)]
    }
    return []
}

func WallKick(blockType: BlockType,cur:Int,to:Int) -> [BlockLocation]{
    switch blockType {
    case .i:
        return getWallKickIO(cur: cur, to: to)
    case .j:
        return getWallKick(cur: cur, to: to)
    case .l:
        return getWallKick(cur: cur, to: to)
    case .o:
        return getWallKickIO(cur: cur, to: to)
    case .s:
        return getWallKick(cur: cur, to: to)
    case .t:
        return getWallKick(cur: cur, to: to)
    case .z:
        return getWallKick(cur: cur, to: to)
    }
}

func getAllBlocks(blockType: BlockType) -> [[BlockLocation]] {
    switch blockType {
    case .i:
        return [[BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 2)],
        [BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0), BlockLocation(row: 2 , column: 0)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: -2)],
        [BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -2, column: 0)]]
    case .j:
        return [[BlockLocation(row: -1, column: -1), BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1)],
        [BlockLocation(row: -1, column: 1), BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0)],
        [BlockLocation(row: 1, column: 1), BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1)],
        [BlockLocation(row: 1, column: -1), BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0)]]
    case .l:
        return [[BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1), BlockLocation(row: -1, column: 1)],
        [BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0), BlockLocation(row: 1, column: 1)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1), BlockLocation(row: 1, column: -1)],
        [BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: -1)]]
    case .o:
        return [[BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: 1)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: 1)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: 1)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: 1)]]
    case .s:
        return [[BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: -1, column: 1)],
        [BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1), BlockLocation(row: 1, column: 1)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0), BlockLocation(row: 1, column: -1)],
        [BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1), BlockLocation(row: -1, column: -1)]]
    case .t:
        return [[BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 1)],
        [BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1), BlockLocation(row: 1, column: 0)],
        [BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: -1)],
        [BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1), BlockLocation(row: -1, column: 0)]]
    case .z:
        return [[BlockLocation(row: -1, column: -1), BlockLocation(row: -1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: 1)],
        [BlockLocation(row: -1, column: 1), BlockLocation(row: 0, column: 1), BlockLocation(row: 0, column: 0), BlockLocation(row: 1, column: 0)],
        [BlockLocation(row: 1, column: 1), BlockLocation(row: 1, column: 0), BlockLocation(row: 0, column: 0), BlockLocation(row: 0, column: -1)],
        [BlockLocation(row: 1, column: -1), BlockLocation(row: 0, column: -1), BlockLocation(row: 0, column: 0), BlockLocation(row: -1, column: 0)]]
    }
}

class Grid:SKSpriteNode {
    var rows:Int!
    var cols:Int!
    var blockSize:CGFloat!
    var curBlock:TetrisGameBlock!
    var lst: [BlockType] = [BlockType.i,BlockType.o,BlockType.t,BlockType.j,BlockType.l,BlockType.s,BlockType.z]
    var curbag: [BlockType] = [BlockType.i,BlockType.o,BlockType.t,BlockType.j,BlockType.l,BlockType.s,BlockType.z]
    var nextbag: [BlockType] = [BlockType.i,BlockType.o,BlockType.t,BlockType.j,BlockType.l,BlockType.s,BlockType.z]
    var bagidx:Int = 0
    var curState:Int = 0
    var toState:Int = 0
    var down:Bool = true
    var Move:Bool = false
    var isOK:Bool = true
    var cnt:Int = 0
    var mcnt:Int = 0
    var rcnt:Int = 0
    var line:Int = 0
    var over:Bool = false
    var curblock:[realloc] = []

    convenience init?(blockSize:CGFloat,rows:Int,cols:Int) {
        guard let texture = Grid.gridTexture(blockSize: blockSize,rows: rows, cols:cols) else {
            return nil
        }
        self.init(texture: texture, color:SKColor.clear, size: texture.size())
        self.blockSize = blockSize
        self.isUserInteractionEnabled = true
        self.rows = rows
        self.cols = cols
        self.curbag = curbag.shuffled()
        self.nextbag = nextbag.shuffled()
        self.bagidx = 0
    }

    func Create(path:String,position:CGPoint) -> SKSpriteNode{
        let sk = SKSpriteNode()
        sk.texture = SKTexture( image: UIImage(named: path)!.circleMasked! )
        sk.size = CGSize(width:35,height: 35)
        sk.position = position
        return sk
    }

    class func gridTexture(blockSize:CGFloat,rows:Int,cols:Int) -> SKTexture? {
        // Add 1 to the height and width to ensure the borders are within the sprite
        let size = CGSize(width: CGFloat(cols)*blockSize+1.0, height: CGFloat(rows)*blockSize+1.0)
        UIGraphicsBeginImageContext(size)

        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        let bezierPath = UIBezierPath()
        let offset:CGFloat = 0.5
        // Draw vertical lines
        for i in 0...cols {
            let x = CGFloat(i)*blockSize + offset
            bezierPath.move(to: CGPoint(x: x, y: 0))
            bezierPath.addLine(to: CGPoint(x: x, y: size.height))
        }
        // Draw horizontal lines
        for i in 0...rows {
            let y = CGFloat(i)*blockSize + offset
            bezierPath.move(to: CGPoint(x: 0, y: y))
            bezierPath.addLine(to: CGPoint(x: size.width, y: y))
        }
        SKColor.black.withAlphaComponent(0.3).setStroke()
        bezierPath.lineWidth = 1.0
        bezierPath.stroke()
        context.addPath(bezierPath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return SKTexture(image: image!)
    }

    func gridPosition(row:Int, col:Int) -> CGPoint {
        let offset = blockSize / 2.0 + 0.5
        let x = CGFloat(col) * blockSize - (blockSize * CGFloat(cols)) / 2.0 + offset
        let y = CGFloat(rows - row - 1) * blockSize - (blockSize * CGFloat(rows)) / 2.0 + offset
        return CGPoint(x:x, y:y)
    }
    struct realloc {
        var x: CGFloat
        var y: CGFloat
    }

    func rotate(dire:Int){
        var tmp = self.curState
        if dire == 2{
            tmp += 1
            if tmp == 4{
                tmp = 0
            }
        }
        else if dire == -2{
            tmp -= 1
            if tmp == -1{
                tmp = 3
            }
        }
        self.toState = tmp
        var A_x:[Int] = []
        var A_y:[Int] = []
        var can:Bool = true
        var block = self.curblock
        for i in 0...3{
                let x = size.width / 2 + self.curblock[i].x
                let y = size.height / 2 - self.curblock[i].y
                let row = Int(floor(y / 35))
                let col = Int(floor(x / 35))
                //print(row)
                A_x.append(col)
                A_y.append(row)
            }
            var check: [BlockLocation] = WallKick(blockType: curBlock.blockType, cur: self.curState, to: self.toState)
            var version:Int = 0
            for k in 0...4{
                can = true
                for i in 0...3{
                    var tmpstate = getAllBlocks(blockType: curBlock.blockType)
                    var ty = A_y[i] + (tmpstate[tmp][i].row - tmpstate[curState][i].row) + check[version].row
                    var tx = A_x[i] + (tmpstate[tmp][i].column - tmpstate[curState][i].column) + check[version].column
                    var tp = gridPosition(row: ty, col: tx)
                    var is_ : Bool = true
                    for j in 0...3{
                        if self.curblock[j].x == tp.x && self.curblock[j].y == tp.y{
                            is_ = false
                        }
                    }
                    if is_{
                        let nextnode = atPoint(tp)
                        if nextnode != self {
                            can = false
                        }
                    }
                    if tx < 0 || tx >= self.cols || ty < 0 || ty >= self.rows{
                        can = false
                    } 
                }
                if can == false{
                    version += 1
                }
                else{
                    break
                }
            }
            if can {
                for i in 0...3{
                    let position = CGPoint(x: block[i].x, y: block[i].y)
                    let node = atPoint(position)
                    let action = SKAction.run{ [self] in
                        var tmpstate = getAllBlocks(blockType: self.curBlock.blockType)
                        let x_tmp = size.width / 2 + node.position.x
                        let y_tmp = size.height / 2 - node.position.y
                        let row_tmp = Int(floor(y_tmp / 35))
                        let col_tmp = Int(floor(x_tmp / 35))
                        //print(i,tmpstate[self.curState][i].row,tmpstate[self.curState][i].column,tmpstate[self.toState][i].row,tmpstate[self.toState][i].column)
                        node.position = self.gridPosition(row: row_tmp + (tmpstate[self.toState][i].row - tmpstate[self.curState][i].row) + check[version].row, col: col_tmp + (tmpstate[self.toState][i].column - tmpstate[self.curState][i].column) + check[version].column)
                        self.curblock[i] = realloc(x: node.position.x, y: node.position.y)

                        if self.down{
                            self.rcnt += 1
                            if(self.rcnt == 4){
                                self.curState = self.toState
                                self.toState = 0
                                self.rcnt = 0

                                var A_x:[Int] = []
                                var A_y:[Int] = []
                                for i in 0...3{
                                    let x = size.width / 2 + self.curblock[i].x
                                    let y = size.height / 2 - self.curblock[i].y
                                    let row = Int(floor(y / 35))
                                    let col = Int(floor(x / 35))
                                    A_x.append(col)
                                    A_y.append(row)
                                }
                                for j in 0...3 {
                                    var ty = A_y[j]+1
                                    var tx = A_x[j]
                                    var tp = gridPosition(row: ty, col: tx)
                                    var is_ : Bool = true

                                    for k in 0...3{
                                        if self.curblock[k].x == tp.x && self.curblock[k].y == tp.y{
                                            is_ = false
                                        }
                                    }
                                    if is_{
                                        let nextnode = atPoint(gridPosition(row: A_y[j]+1, col: A_x[j]))
                                        if nextnode != self || A_y[j]+1 >= self.rows{
                                            self.down = false
                                            print("A_rotate")
                                        }
                                    }
                                }
                                if self.down == false{
                                    for i in 0...3{
                                        let position = CGPoint(x: curblock[i].x, y: curblock[i].y)
                                        let node = atPoint(position)
                                        node.removeAllActions()
                                    }
                                    self.rcnt = 0
                                    reset()
                                }
                            }
                        }
                        else{
                            self.rcnt += 1
                            if self.rcnt == 4{
                                self.curState = self.toState
                                self.toState = 0
                                self.rcnt = 0

                                var A_x:[Int] = []
                                var A_y:[Int] = []
                                for i in 0...3{
                                    let x = size.width / 2 + self.curblock[i].x
                                    let y = size.height / 2 - self.curblock[i].y
                                    let row = Int(floor(y / 35))
                                    let col = Int(floor(x / 35))
                                    A_x.append(col)
                                    A_y.append(row)
                                }

                                var keep:Bool = false
                                for j in 0...3 {
                                    var ty = A_y[j]+1
                                    var tx = A_x[j]
                                    var tp = gridPosition(row: ty, col: tx)
                                    var is_ : Bool = true

                                    for k in 0...3{
                                        if self.curblock[k].x == tp.x && self.curblock[k].y == tp.y{
                                            is_ = false
                                        }
                                    }
                                    if is_{
                                        let nextnode = atPoint(gridPosition(row: A_y[j]+1, col: A_x[j]))
                                        if nextnode != self || A_y[j]+1 >= self.rows{
                                            keep = true
                                        }
                                    }
                                }
                                if keep == false {
                                    self.down = true
                                    self.removeAllActions()
                                    BlockMoveDown(block: self.curblock)
                                }
                            }
                        }
                    }
                    node.run(SKAction.sequence([action]))
                }
            }
    }

    func BlockMove(dire:Int){
        var block = curblock
        var A_x:[Int] = []
        var A_y:[Int] = []
        var can:Bool = true
        for i in 0...3{
            let x = size.width / 2 + self.curblock[i].x
            let y = size.height / 2 - self.curblock[i].y
            let row = Int(floor(y / 35))
            let col = Int(floor(x / 35))
            //print(row)
            A_x.append(col)
            A_y.append(row)
        }
        for i in 0...3 {
            if dire == -1{
                var ty = A_y[i]
                var tx = A_x[i]+dire
                var tp = gridPosition(row: ty, col: tx)
                var is_ : Bool = true
                for j in 0...3{
                if self.curblock[j].x == tp.x && self.curblock[j].y == tp.y{
                        is_ = false
                    }
                }
                if is_{
                    let nextnode = atPoint(gridPosition(row: A_y[i], col: A_x[i]+dire))
                    if nextnode != self {
                        can = false
                    }
                    if A_x[i]+dire < 0{
                        can = false
                    }
                }
            }

            if dire == 1{
                var ty = A_y[i]
                var tx = A_x[i]+dire
                var tp = gridPosition(row: ty, col: tx)
                var is_ : Bool = true
                for j in 0...3{
                    if self.curblock[j].x == tp.x && self.curblock[j].y == tp.y{
                        is_ = false
                    }
                }
                if is_{
                    let nextnode = atPoint(gridPosition(row: A_y[i], col: A_x[i]+dire))
                    if nextnode != self {
                        can = false
                    }
                    if A_x[i]+dire >= self.cols{
                        can = false
                    }
                }
            }
        }
        if can{
            for i in 0...3{
                let position = CGPoint(x: block[i].x, y: block[i].y)
                let node = atPoint(position)

                let action = SKAction.run{ [self] in
                    let x_tmp = size.width / 2 + node.position.x
                    let y_tmp = size.height / 2 - node.position.y
                    let row_tmp = Int(floor(y_tmp / 35))
                    let col_tmp = Int(floor(x_tmp / 35))
                    node.position = self.gridPosition(row: row_tmp, col: col_tmp+dire)
                    self.curblock[i] = realloc(x: node.position.x, y: node.position.y)

                    if self.down{
                        self.mcnt += 1
                        if self.mcnt == 4{
                            var A_x:[Int] = []
                            var A_y:[Int] = []
                            for i in 0...3{
                                let x = size.width / 2 + self.curblock[i].x
                                let y = size.height / 2 - self.curblock[i].y
                                let row = Int(floor(y / 35))
                                let col = Int(floor(x / 35))
                                //print(row)
                                A_x.append(col)
                                A_y.append(row)
                            }
                            for j in 0...3 {
                                var ty = A_y[j]+1
                                var tx = A_x[j]
                                var tp = gridPosition(row: ty, col: tx)
                                var is_ : Bool = true

                                for k in 0...3{
                                    if self.curblock[k].x == tp.x && self.curblock[k].y == tp.y{
                                        is_ = false
                                    }
                                }
                                if is_{
                                    let nextnode = atPoint(gridPosition(row: A_y[j]+1, col: A_x[j]))
                                    if nextnode != self || A_y[j]+1 >= self.rows{
                                        self.down = false
                                        print("A_move")
                                    }
                                }
                            }
                            self.mcnt = 0
                        }
                        if self.down == false{
                            for i in 0...3{
                                let position = CGPoint(x: curblock[i].x, y: curblock[i].y)
                                let node = atPoint(position)
                                node.removeAllActions()
                            }
                            reset()
                            self.mcnt = 0
                        }
                    }
                    else {
                        self.mcnt += 1
                        if self.mcnt == 4{
                            var A_x:[Int] = []
                            var A_y:[Int] = []
                            for i in 0...3{
                                let x = size.width / 2 + self.curblock[i].x
                                let y = size.height / 2 - self.curblock[i].y
                                let row = Int(floor(y / 35))
                                let col = Int(floor(x / 35))
                                //print(row)
                                A_x.append(col)
                                A_y.append(row)
                            }
                            var keep:Bool = false
                            for j in 0...3 {
                                var ty = A_y[j]+1
                                var tx = A_x[j]
                                var tp = gridPosition(row: ty, col: tx)
                                var is_ : Bool = true

                                for k in 0...3{
                                    if self.curblock[k].x == tp.x && self.curblock[k].y == tp.y{
                                        is_ = false
                                    }
                                }
                                if is_{
                                    let nextnode = atPoint(gridPosition(row: A_y[j]+1, col: A_x[j]))
                                    if nextnode != self || A_y[j]+1 >= self.rows{
                                        keep = true
                                    }
                                }
                            }
                            if keep == false {
                                self.down = true
                                self.removeAllActions()
                                BlockMoveDown(block: self.curblock)
                            }
                            self.mcnt = 0
                        }
                    }
                }
                node.run(SKAction.sequence([action]))
            }
        }
    }

    func reset(){
        let action = SKAction.run{[self] in
            self.down = true
            self.curState = 0
            self.toState = 0
            var nxtBlock = place_block(row:0,col:self.cols/2 - 1)
            BlockMoveDown(block: nxtBlock)
        }
        self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),action]))
    }

    func BlockMoveDown(block:[realloc]){
        self.curblock = block
        for i in 0...3{
            let position = CGPoint(x: block[i].x, y: block[i].y)
            let node = atPoint(position)
            
            let action = SKAction.run{ [self] in
                if self.down {
                    let x_tmp = size.width / 2 + node.position.x
                    let y_tmp = size.height / 2 - node.position.y
                    let row_tmp = Int(floor(y_tmp / 35))
                    let col_tmp = Int(floor(x_tmp / 35))
                    node.position = self.gridPosition(row: row_tmp+1, col: col_tmp)
                    self.curblock[i] = realloc(x: node.position.x, y: node.position.y)

                    //print(self.cnt)
                    self.cnt += 1
                    if self.cnt == 4 {
                        var A_x:[Int] = []
                        var A_y:[Int] = []
                        for j in 0...3{
                            let x = size.width / 2 + self.curblock[j].x
                            let y = size.height / 2 - self.curblock[j].y
                            let row = Int(floor(y / 35))
                            let col = Int(floor(x / 35))
                            //print(row)
                            A_x.append(col)
                            A_y.append(row)
                            if row + 1 > 22 {
                                self.down = false
                            }
                        }
                        for j in 0...3 {
                            var ty = A_y[j]+1
                            var tx = A_x[j]
                            var tp = gridPosition(row: ty, col: tx)
                            var is_ : Bool = true

                            for k in 0...3{
                                if self.curblock[k].x == tp.x && self.curblock[k].y == tp.y{
                                    is_ = false
                                }
                            }
                            if is_{
                                let nextnode = atPoint(gridPosition(row: A_y[j]+1, col: A_x[j]))
                                if nextnode != self {
                                    self.down = false
                                }
                            }
                        }
                        self.cnt = 0
                    }
                }
                else{
                    node.removeAllActions()
                    self.cnt += 1
                    if self.cnt == 4 {
                        var check:Int = 0
                        var tmp = getAllBlocks(blockType: self.curBlock.blockType)
                        for j in 0...3{
                            let gennode = atPoint(gridPosition(row: 1 + tmp[0][j].row, col: 4 + tmp[0][j].column))
                            if gennode == self {
                                check += 1
                            }
                        }

                        if check == 4{
                            reset()
                            self.cnt = 0
                        }
                        else{
                            print("over")
                            self.over = true
                        }
                    }
                }
            }
            node.run(SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 0.3),action])), withKey: "Down")
        }
    }
    
    func place_block(row:Int, col:Int) -> [realloc] {
        checkboard()
        if self.isOK{
            garbage()
        }
        var tmp = curbag[bagidx]
        self.curBlock = TetrisGameBlock(blockType: tmp)

        var BlockLoc = getAllBlocks(blockType: tmp)
        var block:[realloc] = []
        for i in 0...3{
            var curpos = gridPosition(row:row + BlockLoc[0][i].row,col:col + BlockLoc[0][i].column)
            var sk = Create(path: getColor(blockType: self.curBlock.blockType),position: curpos)
            block.append(realloc(x: curpos.x,y:curpos.y))
            addChild(sk)
        }
        bagidx += 1
        if bagidx == 7 {
            curbag = nextbag
            nextbag = [BlockType.i,BlockType.o,BlockType.t,BlockType.j,BlockType.l,BlockType.s,BlockType.z].shuffled()
            bagidx = 0
        }
        return block
    }
    func sceneShake(shakeCount: Int, intensity: CGVector, shakeDuration: Double) {
        let sceneView = self.scene!.view! as UIView
        let shakeAnimation = CABasicAnimation(keyPath: "position")

        shakeAnimation.duration = shakeDuration / Double(shakeCount)
        shakeAnimation.repeatCount = Float(shakeCount)
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: sceneView.center.x - intensity.dx, y: sceneView.center.y - intensity.dy))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: sceneView.center.x + intensity.dx, y: sceneView.center.y + intensity.dy))

        sceneView.layer.add(shakeAnimation, forKey: "position")
    }
    func garbage(){
        self.isOK = false
        var rand_garbage = [1,2,3,4]
        var rand_time = [1]
        var randidx :[Int] = []
        for i in 0...self.cols-1{
            randidx.append(i)
        }

        var time = Int(rand_time.randomElement() ?? 0)
        for i in 0...time-1{
            var height = Int(rand_garbage.randomElement() ?? 0)
            var idx = Int(randidx.randomElement() ?? 0)
            for i in (0...self.rows - 1).reversed(){
                for j in 0...self.cols-1{
                    let nextnode = atPoint(gridPosition(row: i, col: j))
                    if nextnode != self {
                        let action = SKAction.run { [self] in
                            var tmp = i-height
                            if tmp < 0{
                                nextnode.run(SKAction.removeFromParent())
                            }
                            else {
                                nextnode.position = self.gridPosition(row: i-height, col: j)
                            }
                        }
                        nextnode.run(action)
                    }
                }
            }
            for i in self.rows - height...self.rows - 1{
                for j in 0...self.cols-1{
                    if j != idx {
                        var sk = Create(path: "gradient_N",position: gridPosition(row: i, col: j))
                        addChild(sk)
                    }
                }
            }
            sceneShake(shakeCount: 3, intensity: CGVector(dx: 3, dy: 1), shakeDuration: 1)
        }
        let action = SKAction.run{ [self] in
            self.isOK = true
        }
        self.run(SKAction.sequence([SKAction.wait(forDuration: 20),action]))
    }

    func checkboard(){
        var row = Int(self.rows)
        var col = Int(self.cols)
        var rm : [Int] = []
        for i in (0...row - 1).reversed(){
            var isBlock: Int = 0
            for j in 0...col-1{
                let nextnode = atPoint(gridPosition(row: i, col: j))
                if nextnode != self {
                    isBlock += 1
                }
            }
            if isBlock == col{
                rm.append(i)
            }
        }
        self.line += rm.count
        for idx in rm{
            for i in 0...col-1{
                let nextnode = atPoint(gridPosition(row: idx, col: i))
                nextnode.run(SKAction.removeFromParent())
            }
        }
        for i in (0...row - 1).reversed(){
            var count : Int = 0
            for idx in rm{
                if idx > i{
                    count += 1
                }
            }
            for j in 0...col-1{
                let nextnode = atPoint(gridPosition(row: i, col: j))
                if nextnode != self{
                    let action = SKAction.run { [self] in
                        nextnode.position = self.gridPosition(row: i+count, col: j)
                    }
                    nextnode.run(action)
                }
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // for touch in touches {
        //     let position = touch.location(in:self)
        //     let node = atPoint(position)
        //     if node != self {
        //         let x = size.width / 2 + position.x
        //         let y = size.height / 2 - position.y
        //         let row = Int(floor(y / blockSize))
        //         let col = Int(floor(x / blockSize))
                

        //         let action = SKAction.run{ [self] in
        //             node.position = self.gridPosition(row: row+1, col: col)
        //         }
        //         node.run(action)
        //     }
        //     else {
        //         let x = size.width / 2 + position.x
        //         let y = size.height / 2 - position.y
        //         let row = Int(floor(y / blockSize))
        //         let col = Int(floor(x / blockSize))
        //         print("\(x) \(y)")
        //         place_block(row:row,col:col)
        //     }
        // }
    }
}

class GameScene: SKScene {
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var time : Int = 0
    private var grid : Grid = Grid()
    @Binding var showScene : Int
    @Binding var dire : Int
    @Binding var score : Int

    init(_ tmp:Binding<Int>,_ tmp2:Binding<Int>,_ tmp3:Binding<Int>){
        _dire = tmp
        _showScene = tmp2
        _score = tmp3
        super.init(size: CGSize(width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func CreateSK(path:String) -> SKSpriteNode{
        let sk = SKSpriteNode(imageNamed: path)
        sk.size = CGSize(width:screen.width,height: screen.height)
        sk.position = CGPoint(x: screen.width/2, y: screen.height/2)
        addChild(sk)
        return sk
    }

    func Create(path:String,x:CGFloat,y:CGFloat) -> SKSpriteNode{
        let sk = SKSpriteNode()
        sk.texture = SKTexture( image: UIImage(named: path)!.circleMasked! )
        sk.size = CGSize(width:35,height: 35)
        sk.position = CGPoint(x: x, y: y)
        addChild(sk)
        return sk
    }

    override func didMove(to view: SKView) {
        //let backgroundSound = SKAudioNode(fileNamed: "BGM_01.wav")
        //self.addChild(backgroundSound)
        if let grid = Grid(blockSize: 35.0, rows:23, cols:10) {
            grid.position = CGPoint (x:frame.midX, y:frame.midY)
            addChild(grid)
            var curBlock = grid.place_block(row:0,col:grid.cols/2 - 1)
            grid.BlockMoveDown(block: curBlock)
            self.grid = grid
        }
        // Create(path: "gradient",x_offset: 0.0,y_offset: 100.0)
        // Create(path: "gradient",x_offset: 52.0,y_offset: 100.0)
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        let timer = SKLabelNode(fontNamed: "Palatino-Bold")
         timer.text = "00:00"
         timer.fontSize = 50
         timer.fontColor = SKColor.purple.withAlphaComponent(0.5)
         timer.position = CGPoint(x: frame.midX, y: frame.midY + frame.midY / 2)
        
        addChild(timer)

        let next = SKLabelNode(fontNamed: "Palatino-Bold")
        next.text = getColor(blockType: self.grid.curbag[self.grid.bagidx])
         next.fontSize = 50
         next.fontColor = SKColor.purple
         next.position = CGPoint(x: frame.midX, y: frame.midY + frame.midY * 2 / 3)
        
        // addChild(next)
        // let act = SKAction.run{[self] in
        //     next.text = getColor(blockType: self.grid.curbag[self.grid.bagidx])
        // }
        // self.run(SKAction.repeatForever(SKAction.sequence([act,SKAction.wait(forDuration: 0.1)])))

        let goal = SKLabelNode(fontNamed: "Palatino-Bold")
        goal.text = "0"
         goal.fontSize = 50
         goal.fontColor = SKColor.purple.withAlphaComponent(0.8)
         goal.position = CGPoint(x: frame.midX, y: frame.midY + frame.midY * 2 / 3)
        
        addChild(goal)

        let act = SKAction.run{[self] in
            goal.text = String(self.grid.line)
        }
        self.run(SKAction.repeatForever(SKAction.sequence([act,SKAction.wait(forDuration: 0.1)])))

        let waitASecond = SKAction.wait(forDuration: 1)
        let timecnt = SKAction.run{
            self.time += 1
            var m = String(self.time/60)
            if m.count == 1{
                m = "0" + m
            }
            var s = String(self.time%60)
            if s.count == 1{
                s = "0" + s
            }
            timer.text = m + ":" + s
        }
        let time_sys = SKAction.sequence([waitASecond,timecnt])
        let timerepeat = SKAction.repeatForever(time_sys)
        self.run(timerepeat)

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
        //showScene *= -1
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

        if let TetrisScene = TetrisScene(fileNamed: "TetrisScene") {
            self.view?.presentScene(TetrisScene)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if dire == 1 || dire == -1{
            self.grid.BlockMove(dire:dire)
            dire = 0
        }
        else if dire == 2 || dire == -2{
            self.grid.rotate(dire: dire)
            dire = 0
        }

        if self.time == 120 || self.grid.over == true{
            score = self.grid.line
            showScene *= 0
        }
    }
}
