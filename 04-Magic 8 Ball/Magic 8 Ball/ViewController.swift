//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var askButton: UIButton!
    
    var ballArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 볼 이미지를 초기화해 변수에 삽입하기
        for number in 1...5 {
            ballArray.append(UIImage(named: "ball" + "\(number)")!)
        }
        // Ask 버튼의 외곽을 둥글게 하기
        askButton.layer.masksToBounds = true
        askButton.layer.cornerRadius = 10.0
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = ballArray.randomElement()
    }
}

