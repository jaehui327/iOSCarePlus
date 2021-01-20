//
//  GameDetailImageViewController.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/20.
//

import UIKit
import Kingfisher

class GameDetailImageViewController: UIViewController {
    
    // MARK: - properties
    var url: String?
    
    // MARK: - IBOutlet
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let stringUrl = url else { return }
        let url = URL(string: stringUrl)
        imageView.kf.setImage(with: url)
    }
}
