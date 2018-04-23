//
//  ViewController.swift
//  SchoolApp
//
//  Created by Dheeraj Paul on 23/04/18.
//  Copyright © 2018 dreamsAlive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var previewImgView: UIImageView!
    @IBOutlet weak var collectionsView: UICollectionView!
    @IBOutlet weak var pageControls: UIPageControl!
    
    
    var images = ["1","2","3","4"]
    var timer = Timer()
    var imageId = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        
    }

    func setImage() {
        
        previewImgView.image = UIImage.init(named: images[0])
        if timer.isValid {
            
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        
        
        pageControls.numberOfPages = images.count

    }
    
    @objc func changeImage() {
        
        imageId = imageId + 1
        let id: Int = imageId % images.count
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionFade
        previewImgView.image = UIImage(named: images[id])
        previewImgView.layer.add(transition, forKey: kCATransition)
        
        
        if imageId != images.count {
            pageControls.currentPage = imageId
        }
        else{
            imageId = 0
            pageControls.currentPage = imageId

        }

        
    }


}

