//
//  SocketServer.swift
//  Task2
//
//  Created by Mac on 20/08/2021.
//

import Foundation
import SwiftSocket

class ServerSocket {
  
   
    func startServer(completion: @escaping (Swift.Result<Data,ServerError>) -> Void)  {
        
        DispatchQueue.global(qos: .background).async {
            let server = TCPServer(address: "127.0.0.1", port: 8080)
                switch server.listen() {
                  case .success:
                    while true {
                        if let client = server.accept() {
                            print("Connected Client: \(client.address):\(client.port)")
                            let d = client.read(4096*35)
                            let collectedData: Data? = Data(bytes: d!, count: d!.count)
                            completion(.success(collectedData!))
                        }else {
                            print("accept Error")
                            completion(.failure(.empty))
                        }
                        
                    }
                  case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

}
enum ServerError: Error {
    case empty
}
