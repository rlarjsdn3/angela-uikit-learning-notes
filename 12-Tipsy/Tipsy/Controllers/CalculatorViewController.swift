//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipModel: TipModel = TipModel()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // 키보드 내리기
        billTextField.endEditing(true)
        // 버튼 선택하기
        zeroPctBtton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipModel.tip = buttonTitleAsANumber / 100.0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipModel.numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // 인 당 지불해야 하는 지불 액수 계산하기
        tipModel.calculateTotalPerPerson(billTextField.text ?? "0.0")
        // 다른 화면으로 세그웨이 이동하기
        performSegue(withIdentifier: "goToResultVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultVC" {
            if let resultVC = segue.destination as? ResultsViewController {
                resultVC.tipModel = tipModel
            }
        }
    }

}

