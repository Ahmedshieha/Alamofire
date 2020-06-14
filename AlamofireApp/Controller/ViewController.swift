//
//  ViewController.swift
//  AlamofireApp
//
//  Created by Reda on 6/10/20.
//  Copyright © 2020 codin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//    fetchFilms()
        
    }
    
    fileprivate func showImage(_ imageData: Dogimage) -> DataRequest {
        return AF.request(imageData.message,method: .get).response { response in
            switch response.result {
            case .success(let responseData) :
                self.imageView.image = UIImage(data : responseData!)
                
            case .failure(let error):
                print("error" , error)
            }
        }
    }
    
    fileprivate func requestRandomUrl() {
        let request = AF.request("https://dog.ceo/api/breeds/image/random")
        
        request.responseData { (response) in
            
            switch response.result
            {
            case.success(let data):
                let decoder = JSONDecoder()
                do {
                    
                    let imageData = try decoder.decode(Dogimage.self, from: data)
                    print(imageData)
                    self.showImage(imageData)
                }
                catch
                {
                    print("error decoding : \(error)")
                    
                }
            case.failure(let error):
                print("\(error)")
            }
            
            
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func LoadPhoto(_ sender: Any) {
         requestRandomUrl()

        
    }
    
  

}
 

