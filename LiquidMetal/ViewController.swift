//
//  ViewController.swift
//  LiquidMetal
//
//  Created by Yvette Cook on 06/11/2015.
//  Copyright © 2015 YvetteCook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gravity: Float = 9.80665
    let ptmRatio: Float = 320
    let particleRadius: Float = 9
    var particleSystem: UnsafeMutablePointer<Void>!

    override func viewDidLoad() {
        super.viewDidLoad()
        LiquidFun.createWorldWithGravity(Vector2D(x: 0, y: -gravity))
        
        particleSystem = LiquidFun.createParticleSystemWithRadius(particleRadius / ptmRatio, dampingStrength: 0.2, gravityScale: 1, density: 1.2)
        
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth = Float(screenSize.width)
        let screenHeight = Float(screenSize.height)
        
        LiquidFun.createParticleBoxForSystem(particleSystem, position: Vector2D(x: screenWidth * 0.5 / ptmRatio, y: screenHeight * 0.5 / ptmRatio), size: Size2D(width: 50 / ptmRatio, height: 50 / ptmRatio))
        
        printParticleInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    func printParticleInfo() {
        let count = Int(LiquidFun.particleCountForSystem(particleSystem))
        print("There are \(count) particles present")
        
        let positions = UnsafePointer<Vector2D>(LiquidFun.particlePositionsForSystem(particleSystem))
        
        for i in 0..<count {
            let position = positions[i]
            print("particle: \(i) position: \(position.x), \(position.y)")
        }
    }


}

