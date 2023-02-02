//
//  dados.swift
//  consumindoAPI
//
//  Created by Student23 on 25/01/23.
//

import Foundation

struct Book: Decodable, Identifiable {
    let id: Int
    var first_name: String
    var age: Int
    var ip_address: String
}

class Api : ObservableObject{
    @Published var dados = [Book]()
    
    func loadData(completion:@escaping ([Book]) -> ()) {
    
        guard let url = URL(string: "https://mocki.io/v1/ca7a437a-855e-47a8-883a-98e9f64bdfa7") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            let books = try! JSONDecoder().decode([Book].self, from: data!)
            print(books)
            DispatchQueue.main.async {
                completion(books)
            }
        }.resume()
        
    }
}
