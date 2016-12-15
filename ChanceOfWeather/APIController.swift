//
//  APIController.swift
//  ChanceOfWeather
//
//  Created by Jonathan Archille on 12/14/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
    func didReceiveAPIResults(_ results: [Any])
}

class APIController
{
    
    var delegate: APIControllerProtocol
    
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    
    func searchItunesFor(_ searchTerm: String)
    {
        //dummy key & coordinates for now
        let apiKey = "ABCDEFGHIHKLMNOP"
        let cityCoord = (10.1234, -120.1234)
        
        let urlPath = "https://api.darksky.net/forecast/\(apiKey)/\(cityCoord)"
        let url = URL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if error != nil
            {
                print(error!.localizedDescription)
            }
            if let dictionary = self.parseJSON(data!)
            {
                if let results = dictionary["results"] as? [Any]
                {
                    self.delegate.didReceiveAPIResults(results)
                }
            }
        })
        task.resume()
        
    }
    
    func parseJSON(_ data: Data) -> [String: Any]?
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any]
            {
                return dictionary
            }
            else
            {
                return nil
            }
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
}
