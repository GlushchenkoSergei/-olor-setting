//
//  ViewController.swift
//  Сolor setting
//
//  Created by mac on 27.03.2022.
//

import UIKit

class SettingColorViewController: UIViewController {
    
    @IBOutlet var mainScreen: UIView!
    
    @IBOutlet var valueRed: UILabel!
    @IBOutlet var valueGreen: UILabel!
    @IBOutlet var valueBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    @IBOutlet var textFieldValueRed: UITextField!
    @IBOutlet var textFieldValueGreen: UITextField!
    @IBOutlet var textFieldValueBlue: UITextField!
    
    @IBOutlet var buttonDoneLabel: UIButton!
    

    
    var colorMainScreen: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValueFromMainScreen()
        setСolorForScreen()
        
        mainScreen.layer.cornerRadius = mainScreen.frame.height/9
        buttonDoneLabel.layer.cornerRadius = buttonDoneLabel.frame.height/4
    }
    

    @IBAction func rgbSlider(_ sender: UISlider) {
        setСolorForScreen()
        switch sender {
        case sliderRed:
            textFieldValueRed.text = String(roundingToHundred(sliderRed.value))
            valueRed.text = textFieldValueRed.text
        case sliderGreen:
            textFieldValueGreen.text = String(roundingToHundred(sliderGreen.value))
            valueGreen.text = textFieldValueGreen.text
        default:
            textFieldValueBlue.text = String(roundingToHundred(sliderBlue.value))
            valueBlue.text = textFieldValueBlue.text
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
        print("Нажал кнопку дан")
    }
 
    
}


extension SettingColorViewController {
    
   private func roundingToHundred(_ value: Float) -> Float {
        round(value * 100)/100
    }
    
    private func setСolorForScreen() {
        mainScreen.backgroundColor = UIColor.init(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }
    
    private func setValueFromMainScreen() {
        
    sliderRed.value = Float(colorMainScreen.cgColor.components![0])
    sliderGreen.value = Float(colorMainScreen.cgColor.components![1])
    sliderBlue.value = Float(colorMainScreen.cgColor.components![2])

    textFieldValueRed.text = "\(roundingToHundred(sliderRed.value))"
    textFieldValueGreen.text = "\(roundingToHundred(sliderGreen.value))"
    textFieldValueBlue.text = "\(roundingToHundred(sliderBlue.value))"

    valueRed.text = textFieldValueRed.text
    valueGreen.text = textFieldValueGreen.text
    valueBlue.text = textFieldValueBlue.text
    }
}

extension SettingColorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldValueRed:
            if let value = Float(textFieldValueRed.text ?? "0.0") {
                sliderRed.value = value
                valueRed.text = String(value)
            }
        case textFieldValueGreen:
            if let value = Float(textFieldValueGreen.text ?? "0.0") {
                sliderGreen.value = value
                valueGreen.text = String(value)
            }
        default:
            if let value = Float(textFieldValueBlue.text ?? "0.0") {
                sliderBlue.value = value
                valueBlue.text = String(value)
            }
        }
        setСolorForScreen()
        return true
    }
}



