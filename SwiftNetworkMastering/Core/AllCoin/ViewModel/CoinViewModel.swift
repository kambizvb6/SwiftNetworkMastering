//
//  CoinViewModel.swift
//  SwiftNetworkMastering
//
//  Created by Kambiz on 2024-02-06.
//

import Foundation

class CoinViewModel: ObservableObject {
  
    @Published var coin = ""
    @Published var price = ""
    @Published var errorMessage: String?
    
    private let service = CoinDataService()
    
    init(){
        fetchCoin(coin: "litecoin")
    }
    func fetchCoin(coin: String){
        service.fetchCoin(coin: coin) { result in
            DispatchQueue.main.async {
                self.coin = coin
                self.price = "\(result)"
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func fetchPrice(coin: String){
//
//
//        let urlString = "https://ap.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    self.errorMessage = error.localizedDescription
//                    print("DEBUG: Failed with error \(error.localizedDescription)")
//                    return
//                }
//                guard let httpResponse = response as? HTTPURLResponse else {
//                    self.errorMessage = "Bad HTTP Response"
//                    return
//                }
//                guard httpResponse.statusCode == 200 else {
//                    self.errorMessage = "Failed to fetch with status code \(httpResponse.statusCode)"
//                    return
//                }
//                guard let data = data else { return }
//                guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
//                guard let value = jsonObject[coin] as? [String: Double] else {
//                    print("Failed to parse value")
//                    return
//                }
//                guard let price = value["usd"] else { return }
//
//                self.coin = coin
//                self.price = "\(price)"
//            }
//        }.resume()
//    }
    





























//    @Published var coin = ""
//    @Published var price = ""
//
//    init() {
//        fetchPrice(coin: "litecoin")
//    }
//    func fetchPrice(coin: String){
//        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
//        guard let url = URL(string: urlString) else { return }
//
//        print("Fetching price ...")
//        print("\(Thread.current)")
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            guard let data = data else { return }
//            print("Did recive data : \(data)")
//            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
//            print(jsonObject)
//            guard let value = jsonObject[coin] as? [String: Double] else {
//                print("Json Decode Error")
//                return
//            }
//            print(value)
//            guard let price = value["usd"] else { return }
//
//            DispatchQueue.main.async { [weak self] in
//
//                self?.coin = coin
//                self?.price = "\(price)"
//
//                print("\(Thread.current)")
//            }
//
//            print("\(Thread.current)")
//        }
//        .resume()
//
//
//    }
    
//    @Published var coin = ""
//    @Published var price = ""
//
//    init(){
//        fetchPrice(coin: "litecoin")
//    }
//    func fetchPrice(coin: String){
//        let urlString = "https://api.coingecko.com/api/v3/simple/price?ids=\(coin)&vs_currencies=usd"
//        guard let url = URL(string: urlString) else { return }
//
//        print("Fetching price ...")
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            print("Did receive data \(data) ")
//            guard let data = data else { return }
//            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
//
//            guard let value = jsonObject[coin] as? [String: Double] else {
//
//                print("Failed to parse value")
//                return
//            }
//
//            guard let price = value["usd"] else { return }
//
//            DispatchQueue.main.async {
//                self.coin = coin.capitalized
//                self.price = "\(price)"
//            }
//        }.resume()
//
//        print("Did reach end of function..")
//    }
}
