//
//  UIImageView+Download.swift
//  MeuPrimeiroAppIOS
//
//  Created by user on 19/08/23.
//

import UIKit

extension UIImageView {
    func download(path: String) {
        var img:String = "https://cdn2.thecatapi.com/images/"
        img.append(path)
        img.append(".jpg")
        var imageUrl = URL(string: img)!
        
      
        let task = URLSession.shared.dataTask(with: .init(url: imageUrl)) { data, response, error in
            if error != nil {return }
            guard let data else {return}
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
        }
        task.resume()
    }
}
