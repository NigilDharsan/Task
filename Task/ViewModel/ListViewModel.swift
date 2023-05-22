//
//  ListViewModel.swift
//  Task
//
//  Created by MAHENDRAN on 20/05/23.
//

import Foundation


class listViewModel {
    
    weak var controller: ViewController!
    init(controller: ViewController!) {
        self.controller = controller
    }

    
    func Apicalling(){
        var request = URLRequest(url: URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/word")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print("Response")
            do {
               
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([WelcomeElement].self, from: data!)
                self.controller.isSuccess(Details: responseModel)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
}

