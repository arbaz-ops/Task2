//
//  FirstViewController.swift
//  Task2
//
//  Created by Mac on 21/08/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let socketServer = ServerSocket()
        
        socketServer.startServer(completion: { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
                
            case .failure(.empty):
                print("empty")
            }
        })
        // Do any additional setup after loading the view.
    }
    
    @IBAction func phone2Tapped(_ sender: Any) {
        let scv = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        navigationController?.pushViewController(scv!, animated: true)
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
