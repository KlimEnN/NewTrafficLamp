//
//  ViewController.swift
//  NewTrafficLamp
//
//  Created by Андрей Клименко on 20.08.2021.
//

import UIKit

enum CurrentLamp {
    case red, yellow, green
}


class ViewController: UIViewController {
    
    @IBOutlet weak var red: UIView!
    @IBOutlet weak var yellow: UIView!
    @IBOutlet weak var green: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    private var currentLamp = CurrentLamp.red
    private let lampOn: CGFloat = 1
    private let lampOff: CGFloat = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 10
        
        red.alpha = lampOff
        yellow.alpha = lampOff
        green.alpha = lampOff
    }

    override func viewDidLayoutSubviews() {
        red.layer.cornerRadius = red.frame.width / 2
        yellow.layer.cornerRadius = yellow.frame.width / 2
        green.layer.cornerRadius = green.frame.width / 2
    }
    
    @IBAction func startButton() {
        if button.currentTitle == "START" {
            button.setTitle("NEXT", for: .normal)
        }
        
        switch currentLamp {
        case .red:
            green.alpha = lampOff
            yellow.alpha = lampOn
            currentLamp = .yellow
        case .yellow:
            red.alpha = lampOff
            yellow.alpha = lampOn
            currentLamp = .green
        case .green:
            green.alpha = lampOn
            yellow.alpha = lampOff
            currentLamp = .red
        }
    }
    

}

