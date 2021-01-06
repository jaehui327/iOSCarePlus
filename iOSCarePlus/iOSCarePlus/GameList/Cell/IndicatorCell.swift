//
//  IndicatorCell.swift
//  iOSCarePlus
//
//  Created by JHKim on 2021/01/06.
//

import UIKit

class IndicatorCell: UITableViewCell {
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    func animationIndicatorView() {
        activityIndicatorView.startAnimating()
    }
}
