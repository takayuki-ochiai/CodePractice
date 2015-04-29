//
//  ViewController.swift
//  Hi and Low
//
//  Created by 落合隆行 on 2015/04/26.
//  Copyright (c) 2015年 落合隆行. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guide: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var hitCounter: UILabel!
    var count = 0
    var rndInt1 = Int(arc4random_uniform(19))
    
    //簡単バージョン
    
    var rndInt2 = Int(arc4random_uniform(19))
    
    @IBAction func TouchBtnGo(sender: AnyObject) {
        var inputValue = input.text.toInt()!
        confirmInputNum(&rndInt1, inputNum: inputValue, guide: guide, count: &count, label: hitCounter)
    }
    
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
        guide.text = "数字を入力してください"
        hitCounter.text = "当たるまでの回数: 0回"
    }
    
    func confirmInputNum(inout rndInt: Int, inputNum: Int, guide: UILabel, inout count: Int, label: UILabel) {
        if inputNum > rndInt {
            guide.text = "もっと小さいです"
            count++
            reloadCounter(count, label: label)
        } else if inputNum < rndInt {
            guide.text = "もっと大きいです"
            count++
            reloadCounter(count, label: label)
        } else {
            var alert = UIAlertView()
            alert.title = "あたりです"
            alert.message = "あたりです"
            alert.addButtonWithTitle("OK")
            alert.show()
            reset(&count, rndInt: &rndInt, label: label)
        }
    }
}
