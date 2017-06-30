//
//  SecondViewController.swift
//  todo
//
//  Created by Pushkar N Kulkarni on 01/06/17.
//  Copyright © 2017 Pushkar N Kulkarni. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        if let text = input.text {
            list.append(text)
            let jsonObj:Dictionary<String, Any> = [
                "uid" : "uid -\(arc4random())",
                "taskName" : text]
            
            
            if (!JSONSerialization.isValidJSONObject(jsonObj)) {
                print("is not a valid json object")
                return
            }
            
            if let postData = try? JSONSerialization.data(withJSONObject: jsonObj, options: JSONSerialization.WritingOptions.prettyPrinted) {
                print(postData)
                do {
                    try TodoServerAPI.todoItemCreate(data: postData ,completionHandler:
                    {
                        data,response, error in
                        print(" response \(response)")
                    })
                } catch {
                    print(" ERROR ")
                }
            }
            
            input.text = nil
        }
    }
    
    @IBOutlet weak var addItem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

