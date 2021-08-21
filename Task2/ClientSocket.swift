//
//  ClientSocket.swift
//  Task2
//
//  Created by Mac on 20/08/2021.
//

import Foundation
import SwiftSocket

class ClientSocket {
    var client : TCPClient?
    
    init() {
        client = TCPClient(address: "127.0.0.1", port: 8080)
    }
    
    
    func connectToServer(completion: @escaping (Swift.Result<String, ClientError>) -> Void) {
        
            switch client!.connect(timeout: 10) {
            case .success:
                
                let picData = UIImage(named: "pic")?.jpegData(compressionQuality: 0.5)
                switch client!.send(data: picData!) {
                case .success:
                    guard let data = client!.read(8096*10) else {return}
                    
                    print(data)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.serverNotStarted))
            }
    }
    
    
}

enum ClientError:Error {
    case serverNotStarted
}
