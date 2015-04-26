//: Playground - noun: a place where people can play

import UIKit

class MyController: UITableViewController {
    override func viewDidLoad() {
        //親のメソッド呼びだし
        self.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルの行数を返す
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //セルを取得する
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel.text = "Swift"
        return cell
    }
    
}

var controller = MyController()
controller.view

