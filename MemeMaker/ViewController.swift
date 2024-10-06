//
//  ViewController.swift
//  MemeMaker
//
//  Created by Doruk GÜÇLÜ on 2.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle:
           choice.emoji, at: topChoices.count,animated: false)
     }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle:
           choice.emoji, at: bottomChoices.count,animated: false)
     }
        bottomSegmentedControl.selectedSegmentIndex = 0

        updateLabels()
}
    
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
        topCaptionLabel.center =
           sender.location(in: view)
    }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
        bottomCaptionLabel.center =
           sender.location(in: view)
    }
}
    
    @IBAction func segmentedControls(_ sender: UISegmentedControl) {
            updateLabels()
        }
        
        // Method to update the labels based on the selected segment
        func updateLabels() {
            // Get the selected top and bottom captions
            let topSelectedIndex = topSegmentedControl.selectedSegmentIndex
            let bottomSelectedIndex = bottomSegmentedControl.selectedSegmentIndex
            
            // Use the selected index to get the correct CaptionOption
            let topChoice = topChoices[topSelectedIndex]
            let bottomChoice = bottomChoices[bottomSelectedIndex]
            
            // Set the labels to the corresponding captions
            topCaptionLabel.text = topChoice.caption
            bottomCaptionLabel.text = bottomChoice.caption
        }
    
    let topChoices = [
        CaptionOption(emoji: "😂", caption: "You know whats funny?"),
        CaptionOption(emoji: "🦍", caption: "You know what I want to kill?"),
        CaptionOption(emoji: "😶‍🌫️", caption: "Can you guess what's living in my head?")
    ]
    
    let bottomChoices = [
        CaptionOption(emoji: "🥶", caption: "That screaming boy from 2016"),
        CaptionOption(emoji: "😀", caption: "You"),
        CaptionOption(emoji: "🫣", caption: "A hot, delicious lahmacun")
    ]
    
}
