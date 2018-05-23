//
//  SNViewPullable.swift
//  SNViewPullable
//
//  Created by krazie99 on 2018. 5. 23..
//  Copyright © 2018년 Sean Choi. All rights reserved.
//

import UIKit

protocol SNViewPullable : class  {
    var pullableOriginPoint: CGPoint { get set }
    var pullableMaxDistance: CGFloat { get }
    
    var viewAnimationDuration: TimeInterval { get }
    
    func addViewPullablePanGesture()
    func handleViewPullablePanGesture(_ gesture: UIPanGestureRecognizer)
    
    func viewPullingBegin()
    func viewPullingMoved()
    func viewPullingCancel()
    func viewPullingWillEnd()
    func viewPullingDidEnd()
}

//MARK:
extension SNViewPullable {
    func viewPullingBegin() { }
    func viewPullingMoved() { }
    func viewPullingCancel() { }
    func viewPullingWillEnd() { }
    func viewPullingDidEnd() { }
}

//MARK: Pull Gestures
extension SNViewPullable where Self: UIViewController  {
    
    func addViewPullablePanGesture() {
        let gesture = UIPanGestureRecognizer(target: self, action: .swipePangesture)
        self.view.addGestureRecognizer(gesture)
    }
    
    func handleViewPullablePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        var pulledLength : CGFloat = 0
        var targetFrame = self.view.frame
        
        switch gesture.state {
        case .began:
            self.pullableOriginPoint = translation
            self.viewPullingBegin()
        case .changed:
            pulledLength = translation.y - pullableOriginPoint.y
            if pulledLength < 0 {
                pulledLength = 0
            }
            targetFrame.origin.y = pulledLength
            self.view.frame = targetFrame
            self.viewPullingMoved()
        case .ended, .cancelled:
            pulledLength = translation.y - pullableOriginPoint.y
            if pulledLength < pullableMaxDistance {
                targetFrame.origin.y = 0
                UIView.animate(withDuration: viewAnimationDuration) {
                    self.view.frame = targetFrame
                }
                self.viewPullingCancel()
            } else {
                self.viewPullingWillEnd()
                self.dismiss(animated: true, completion: nil)
                self.viewPullingDidEnd()
            }
        default: break
            
        }
    }
}

//MARK: Private extensions
fileprivate extension UIViewController {
    @objc func _handleViewPullablePanGesture(_ gesture: UIPanGestureRecognizer) {
        if let pullable = self as? SNViewPullable {
            pullable.handleViewPullablePanGesture(gesture)
        }
    }
}

fileprivate extension Selector {
    static let swipePangesture =
        #selector(UIViewController._handleViewPullablePanGesture(_:))
}
