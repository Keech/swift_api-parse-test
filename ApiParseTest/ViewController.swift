//
//  ViewController.swift
//  ApiParseTest
//
//  Created by 中村 貴一 on 2014/09/21.
//  Copyright (c) 2014年 Keech. All rights reserved.
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


    @IBAction func load(sender: AnyObject) {
        getData()
    }
    
    func getData(){
        let URL = NSURL(string: "http://express.heartrails.com/api/json?method=getPrefectures")
        let req = NSURLRequest(URL: URL)
        
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue(), completionHandler: response)
    }
    
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        
        let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
        
        let res: NSDictionary = json.objectForKey("response") as NSDictionary
        let pref: NSArray = res.objectForKey("prefecture") as NSArray
        
        //1行ずつログに表示
        for var i=0; i<pref.count; i++ {
            println(pref[i])
        }
    }
   
}

