//
//  ViewController.swift
//  BapsTemples
//
//  Created by Shiv Bhagat on 5/22/21.
//

import UIKit

class AnimationController: UIViewController {

    private let imageview: UIImageView = {
            let imageview = UIImageView(frame: CGRect(x:0, y:0, width:150, height:150))
            imageview.image = UIImage(named: "logo")
            return imageview
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(imageview)
        }
        
     
        override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                imageview.center = view.center
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                self.animate()
            })
            }
     
        private func animate() {
            UIView.animate(withDuration: 1, animations: {
                let size = self.view.frame.size.width * 3
                let diffX = size - self.view.frame.size.width
                let diffY = self.view.frame.height - size
                
                self.imageview.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)
                self.imageview.alpha = 0
            })
            UIView.animate(withDuration: 1.5, animations: {
                self.imageview.alpha = 0
            }, completion:{ done in
                if done {
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
                        self.nextsegue()
                    })
                    
            }
     
            })
     
        }
    func nextsegue() {
        performSegue(withIdentifier:"firstSegue", sender: self)
    }
           
}

