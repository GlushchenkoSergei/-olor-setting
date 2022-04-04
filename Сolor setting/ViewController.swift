//
//  ViewController.swift
//  Сolor setting
//
//  Created by mac on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainScreen: UIView!
    
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    @IBOutlet var buttonDoneLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScreen.layer.cornerRadius = mainScreen.frame.width/20
        buttonDoneLabel.layer.cornerRadius = buttonDoneLabel.frame.height/4
    }
    
    @IBAction func sliderRedAction() {
        valueRed.text = "\(roundingToHundred(sliderRed.value))"
        changingСolorScreen()
    }
    @IBAction func sliderGreenAction() {
        valueGreen.text = "\(roundingToHundred(sliderGreen.value))"
        changingСolorScreen()
    }
    @IBAction func sliderBlueAction() {
        valueBlue.text = "\(roundingToHundred(sliderBlue.value))"
        changingСolorScreen()
    }
    
}

extension ViewController {
    
   private func roundingToHundred(_ value: Float) -> Float {
        round(value * 100)/100
    }
    
    private func changingСolorScreen() {
        mainScreen.backgroundColor = UIColor.init(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
}


