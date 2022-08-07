//
//  NASAManager.swift
//  NASA
//
//  Created by Bryan Johnson on 8/6/22.
//

import Foundation

class NASAModel {
    func getAPOD() async throws -> NASA {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)"
) else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(NASA.self, from: data)
        print(decodedData)
        return decodedData
    }
}

//Example for JSON Parsing

struct NASA: Decodable, Hashable {
    var date: String
    var explanation: String
    var hdurl: String
    var media_type: String
    var title: String
    var url: String
}

