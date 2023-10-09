//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        let stock = coinManager.stocksArray[0]
        coinManager.getCoinPrice(for: stock)
    }
    
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.stocksArray.count
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.stocksArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.stocksArray[row]
        print(selectedCurrency)
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
}

extension ViewController: CoinDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateCoinPrice(_ tradePrice: Int) {
        DispatchQueue.main.async {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let priceString = formatter.string(from: tradePrice as NSNumber)
            self.bitcoinLabel.text = priceString
        }
    }
    
}

