//
//  ViewController.swift
//  memoryGame
//
//  Created by Scott McMillan on 7/13/20.
//  Copyright © 2020 Scott McMillan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "1")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    }


}

