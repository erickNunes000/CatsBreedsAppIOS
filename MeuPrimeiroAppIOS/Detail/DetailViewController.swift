//
//  DetailViewController.swift
//  MeuPrimeiroAppIOS
//
//  Created by user on 09/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var catDescriptionText: UILabel!
    @IBOutlet weak var catCaracText: UILabel!
    @IBOutlet weak var catOriginText: UILabel!
    
    var cat: Cat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        catImage.layer.cornerRadius = 8
        catImage.layer.masksToBounds = true
        catImage.contentMode = .scaleAspectFill
        catImage.backgroundColor = .orange
        
        
        catName.text = cat.name
        catDescriptionText.text = cat.description
        catCaracText.text = cat.temperament
        catOriginText.text = cat.origin
        catImage.download(path: cat.referenceImageId ?? "")
    }
    /*
    func configure(with cat: Cat) {
        catName.text = cat.name
        catDescriptionText.text = cat.description
        catCaracText.text = cat.temperament
        catOriginText.text = cat.origin
        catImage.download(path: cat.referenceImageId ?? "")
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
