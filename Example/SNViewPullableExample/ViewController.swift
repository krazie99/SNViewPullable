//
//  ViewController.swift
//  SNViewPullableExample
//
//  Created by krazie99 on 2018. 5. 23..
//  Copyright © 2018년 Sean Choi. All rights reserved.
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

    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second" {
            if let secondViewController = segue.destination as? SecondViewController {
                secondViewController.providesPresentationContextTransitionStyle = true
                secondViewController.definesPresentationContext = true
                secondViewController.modalPresentationStyle = .overCurrentContext
                secondViewController.modalPresentationCapturesStatusBarAppearance = true
            }
        }
     }
}

