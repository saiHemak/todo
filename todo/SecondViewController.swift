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

