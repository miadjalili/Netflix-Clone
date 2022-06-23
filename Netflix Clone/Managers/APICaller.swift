//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 19.06.2022.
//

import Foundation

struct constants {
    static let Api_Key = "7f1cd29d3592441830d88b6198984efe"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError {
    case failedTogetData
}


class APICaller {
    static let shared = APICaller()
    
    
    
    func getTrendMovies(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/trending/movie/day?api_key=\(constants.Api_Key)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/trending/tv/day?api_key=\(constants.Api_Key)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpComingMovie(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/movie/upcoming?api_key=\(constants.Api_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/movie/popular?api_key=\(constants.Api_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRate(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/movie/top_rated?api_key=\(constants.Api_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getDiscoversMovies(completion: @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(constants.baseURL)/3/discover/movie?api_key=\(constants.Api_Key)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    
    }
    
    
    
}
