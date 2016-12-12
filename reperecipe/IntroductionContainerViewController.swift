//
//  IntroductionContainerViewController.swift
//  reperecipe
//
//  Created by Takuya Shikichi on 2016/08/08.
//  Copyright © 2016年 Takuya Shikichi. All rights reserved.
//

import UIKit

class IntroductionContainerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    var pageIndex: Int = 0
    var name = ""    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = name
        mainImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}