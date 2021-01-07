//
//  ViewController.swift
//  StoryboardExample
//
//  Created by JHKim on 2021/01/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTouchAction(_ sender: Any) {
        print("touch")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

