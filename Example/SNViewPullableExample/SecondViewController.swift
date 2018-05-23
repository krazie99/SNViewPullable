//
//  SecondViewController.swift
//  SNViewPullableExample
//
//  Created by krazie99 on 2018. 5. 23..
//  Copyright © 2018년 Sean Choi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, SNViewPullable {
   
    //MARK: SNViewPullable
    var pullableOriginPoint: CGPoint = CGPoint.zero
    var pullableMaxLength: CGFloat = 200
    
    func viewPullingBegin() {
    }
    
    func viewPullingMoved() {
    }
    
    func viewPullingLessMaxLength() {
    }
    
    func viewPullingOverMaxLength() {
    }
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //add pullable pan gesture
        addViewPullablePanGesture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Action
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}