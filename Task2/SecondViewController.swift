//
//  SecondViewController.swift
//  Task2
//
//  Created by Mac on 21/08/2021.
//

import UIKit

protocol ShowConnectedClient {
    func connectedClient(client: String)
}

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func sendImageTapped(_ sender: Any) {
       
            let clientSocket = ClientSocket()
        clientSocket.connectToServer { result in
            switch result {
            case .success(let str):
                print(str)
            case .failure(.serverNotStarted):
                print("server not started")

            }
        }
 
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
