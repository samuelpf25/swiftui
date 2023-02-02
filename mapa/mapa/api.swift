//
//  dados.swift
//  consumindoAPI
//
//  Created by Student23 on 25/01/23.
//

import Foundation

struct Book: Decodable, Identifiable{
    let id = UUID()
    let _id: String
    var nomelocal: String
    var latitude: String
    var longitude: String
}

class Api : ObservableObject{
    @Published var dados = [Book]()
    
    func loadData(completion:@escaping ([Book]) -> ()) {
    
        guard let url = URL(string: "http://127.0.0.1:1880/readsamuelmapa") else {
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
