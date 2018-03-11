//
//  ExpandingView.swift
//  ExpandingView
//
//  Created by Balazs Vincze on 2018. 03. 11..
//  Copyright © 2018. Balazs Vincze. All rights reserved.
//

import Foundation
import UIKit

class ExpandingView: UIView {
    // Animation duration
    var expandAnimationDuration = 0.35
    
    // Round to circle
    var isCircular = false
    
    // BOOL to check if view is in expanded state
    private var isExpanded = false
    
    // Save original frame
    private var originalFrame: CGRect!
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // MARK: Functions
    
    // Set up the view
    func setUpView() {
        // Set original frame
        originalFrame = frame
        
        // Enable user interaction
        isUserInteractionEnabled = true
        
        // Round corners to circle
        if isCircular {
            layer.cornerRadius = frame.width/2
            layer.masksToBounds = true
        }
        
        // Add tap gesture recognizer for expanding
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGesture)
        
        // Add swipe gesture recognizer for closing
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeGesture.direction = .down
        addGestureRecognizer(swipeGesture)
        
    }
    
    // Expand the view
    func expand() {
        // Bring view forward
        superview?.bringSubview(toFront: self)
        
        // Animate expanding
        UIView.animate(withDuration: self.expandAnimationDuration, animations: {
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            if self.isCircular {
                self.layer.cornerRadius = 0
            }
        }, completion: { finished in
            self.isExpanded = true
        })
    }
    
    // Shrink the view
    @objc func shrink() {
        // Animate shrinking
        UIView.animate(withDuration: self.expandAnimationDuration, animations: {
            self.frame = self.originalFrame
            if self.isCircular {
                self.layer.cornerRadius = self.originalFrame.width/2
            }
        }, completion: { finished in
            self.isExpanded = false
        })
    }
    
    // MARK: Actions
    
    // View was tapped
    @objc func tapped() {
        if !isExpanded {
            expand()
        }
    }
    
    // View was swpied
    @objc func swiped() {
        if isExpanded {
            shrink()
        }
    }
}
