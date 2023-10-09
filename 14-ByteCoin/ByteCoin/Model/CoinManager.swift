//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinDelegate {
    func didFailWithError(error: Error)
    func didUpdateCoinPrice(_ tradePrice: Int)
}

struct CoinManager {
    
    let baseURL = "https://crix-api-endpoint.upbit.com/v1/crix/candles/days/?code=CRIX.UPBIT"
    let apiKey = "46FE8FE6-CA35-418C-89C1-1D52C6602C2A"
    
    let stocksArray = ["ADA", "ETC", "XRP", "BTC", "ARK"]

    var delegate: CoinDelegate?
    
    func getCoinPrice(for stock: String) {
        // URL 만들기
        let urlString = "\(baseURL).KRW-\(stock)"
        // 비동기 HTTP 통신하기
        performReqeust(with: urlString)
    }
    
    private func performReqeust(with urlString: String) {
        // URL 만들기
        guard let url = URL(string: urlString) else { return }
        // URLSession으로 비동기 통신하기
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            // 에러가 발생하였다면
            if error != nil {
                delegate?.didFailWithError(error: error!)
                return
            }
            
            if let safeData = data {
                if let tradePrice = parseJSON(safeData) {
                    delegate?.didUpdateCoinPrice(tradePrice)
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ data: Data) -> Int? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Coins.self, from: data)
            return decodedData.first?.tradePrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
