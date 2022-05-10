//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailedWithError(error: Error)
    func didUpdateCurrency(_ coinManager: CoinManager, rate: Double)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "045A2A49-33A4-450F-B366-A3E6061508EE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            let task = session.dataTask(with: url) {(data, response, error) in
//                print("Data: \(data!)")
                if error != nil {
                    print("Task Error: \(error!)")
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let rate = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, rate: rate)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    func parseJSON(_ data: Data) -> Double? {
        print("Parsing JSON")
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            print("DECODED DATA: \(decodedData)")
            let lastPrice = decodedData.rate
            print("Last PRICE: \(lastPrice)")
            return lastPrice

        } catch {
            print("Parse Error: \(error)")
            delegate?.didFailedWithError(error: error)
            return nil
        }
    }
    
}
