//
//  ViewController.swift
//  FirstApp
//
//  Created by 落合隆行 on 2015/04/26.
//  Copyright (c) 2015年 落合隆行. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBOutlet weak var textField: UITextField!

    @IBAction func sayHello(sender: AnyObject) {
        textField.text = "hello Swift!"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
