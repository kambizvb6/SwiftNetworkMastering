//
//  CoinDataService.swift
//  SwiftNetworkMastering
//
//  Created by Kambiz on 2024-02-06.
//

import Foundation

class CoinDataService {
    
    
    func fetchCoin(coin:String, completion:@escaping(Double)-> ()) {
        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
        guard let url = URL(string: urlString) else { return }
        print("Fetching data ...")
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //self.errorMessage = error.localizedDescription
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                //self.errorMessage = "Bad HTTP Response"
                return
            }
            guard httpResponse.statusCode == 200 else {
                //self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
                return
            }
            guard let data = data else { return }
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data)as? [String: Any] else {
                print("Failed to pars data")
                return }
            guard let value = jsonObject[coin] as? [String: Double] else { return }
            guard let price = value["usd"] else { return }
                    
            //self.coin = coin
            //self.price = "\(price)"
            completion(price)
            print("Fetching complete.")
        }.resume()
    }
}
