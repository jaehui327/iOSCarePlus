//
//  GameDetailViewController.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/20.
//

import UIKit

class GameDetailViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var containerViewController: UIView!
    
    // MARK: - properties
    var model: NewGameContent?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // let destination = segue.destination as? GameDetailViewController
        // destination?.model = model
        
        (segue.destination as? GameDetailPageViewController)?.model = model
    }
}
