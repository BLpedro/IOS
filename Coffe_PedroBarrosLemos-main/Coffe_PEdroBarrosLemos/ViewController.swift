//
//  ViewController.swift
//  coffe_pedroBarros
//
//  Created by COTEMIG on 10/11/22.
//

import UIKit
import Alamofire
import Kingfisher

struct Cafe: Decodable {
 let file: String
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var listaCafes:  [Cafe]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        novaFoto()
        // Do any additional setup after loading the view.
    }

    @IBAction func recarregar(_ sender: Any) {
        novaFoto()
    }
    
    func novaFoto(){
        AF.request("https://coffee.alexflipnote.dev/random.json").responseDecodable(of: Cafe.self){
            response in
            if let cafe = response.value {
                self.imageView.kf.setImage(with: URL(string: cafe.file))

            }
        }
    }
    
}
