//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let imageNames = [
        "DiceOne", "DiceTwo", "DiceThree",
        "DiceFour", "DiceFive", "DiceSix"
    ]
    var diceImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // roll 버튼 외관 수정하기
        rollButton.layer.masksToBounds = true
        rollButton.layer.cornerRadius = 10
        
        // 주사위 이미지를 만들어 배열에 삽입하기
        for imageName in imageNames {
            diceImages.append(UIImage(named: imageName)!)
        }
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageView1.image = diceImages.randomElement()
        diceImageView2.image = diceImages.randomElement()
    }
}

