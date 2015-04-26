//
//  ViewController.swift
//  Hi and Low
//
//  Created by 落合隆行 on 2015/04/26.
//  Copyright (c) 2015年 落合隆行. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reset(inout count: Int, inout rndInt: Int, label: UILabel){
        rndInt = Int(arc4random_uniform(19))
        count = 0
        reloadCounter(count, label: label)
        label.text = "0 ~ 19の数字を入れてボタンを押してください"
    }
    
    func reloadCounter(count: Int, label: UILabel){
        label.text = "当たるまでの回数: \(count)回"
    }
    
    func showFirstMessage(guide: UILabel, hitCounter: UILabel) {
        guide.text = "1~19までの数字を入力してください"
        hitCounter.text = "当たるまでの回数: 0回"
    }
    
    @IBOutlet weak var guide: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var hitCounter: UILabel!
    var count = 0
    var rndInt1 = Int(arc4random_uniform(19))
    
    @IBAction func TouchBtnGo(sender: AnyObject) {
        var inputValue = input.text.toInt()!
        
        if inputValue > rndInt1 {
            guide.text = "もっと小さいです"
            count++
            reloadCounter(count, label: hitCounter)
        } else if inputValue < rndInt1 {
            guide.text = "もっと大きいです"
            count++
            reloadCounter(count, label: hitCounter)
        } else {
            var alert = UIAlertView()
            alert.title = "あたりです"
            alert.message = "あたりです"
            alert.addButtonWithTitle("OK")
            alert.show()
            reset(&count, rndInt: &rndInt1, label: hitCounter)
        }
    }
}
//
//class Page1ViewController: ViewController {
//    @IBOutlet weak var guide: UILabel!
//    @IBOutlet weak var input: UITextField!
//    @IBOutlet weak var hitCounter: UILabel!
//    
//    var count = 0
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        guide.text = "0 ~ 19の数字を入れてボタンを押してください"
//        hitCounter.text = "当たるまでの回数: \(count)回"
//    }
//    
//    var rndInt1 = Int(arc4random_uniform(19))
//    
//
//    
//    @IBAction func TouchBtnGo(sender: AnyObject) {
//        var inputValue = input.text.toInt()!
//        
//        if inputValue > rndInt1 {
//            guide.text = "もっと小さいです"
//            count++
//            reloadCounter(count, label: hitCounter)
//        } else if inputValue < rndInt1 {
//            guide.text = "もっと大きいです"
//            count++
//            reloadCounter(count, label: hitCounter)
//        } else {
//            var alert = UIAlertView()
//            alert.title = "あたりです"
//            alert.message = "あたりです"
//            alert.addButtonWithTitle("OK")
//            alert.show()
//            reset(&count, rndInt: &rndInt1, label: hitCounter)
//        }
//    }
//}

