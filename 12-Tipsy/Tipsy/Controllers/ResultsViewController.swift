//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 김건우 on 2023/10/05.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipModel: TipModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = tipModel!.finalResult
        settingsLabel.text = "Split between \(tipModel!.numberOfPeople) people, with \(tipModel!.tip)% tip."
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
