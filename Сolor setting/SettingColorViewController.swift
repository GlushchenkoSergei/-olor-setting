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
    var delegate: SettingColorViewControllerDelegate!
    
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
            textFieldValueRed.text = getShortString(from: sliderRed.value)
            valueRed.text = textFieldValueRed.text
        case sliderGreen:
            textFieldValueGreen.text = getShortString(from: sliderGreen.value)
            valueGreen.text = textFieldValueGreen.text
        default:
            textFieldValueBlue.text = getShortString(from: sliderBlue.value)
            valueBlue.text = textFieldValueBlue.text
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate.setNewColor(for: mainScreen.backgroundColor ?? UIColor.init(
            red: CGFloat(Float(0)),
            green: CGFloat(Float(0)),
            blue: CGFloat(Float(0)),
            alpha: 1)
        )
        dismiss(animated: true)
    }
}


extension SettingColorViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
   private func getShortString(from value: Float) -> String {
        let roundValue = round(value * 1)/1
       let shortString = "\(Int(roundValue))"
       return shortString
    }
    
    private func setСolorForScreen() {
        mainScreen.backgroundColor = UIColor.init(
            red: CGFloat(sliderRed.value / 100),
            green: CGFloat(sliderGreen.value / 100),
            blue: CGFloat(sliderBlue.value / 100),
            alpha: 1)
    }
    
    private func setValueFromMainScreen() {
        
    sliderRed.value = (Float(colorMainScreen.cgColor.components![0])) * 100
    sliderGreen.value = (Float(colorMainScreen.cgColor.components![1])) * 100
    sliderBlue.value = (Float(colorMainScreen.cgColor.components![2])) * 100

    textFieldValueRed.text = getShortString(from: sliderRed.value)
    textFieldValueGreen.text = getShortString(from: sliderGreen.value)
    textFieldValueBlue.text = getShortString(from: sliderBlue.value)

    valueRed.text = textFieldValueRed.text
    valueGreen.text = textFieldValueGreen.text
    valueBlue.text = textFieldValueBlue.text
    }
}

// MARK - Set Text Field Delegate
extension SettingColorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case textFieldValueRed:
           actionAfterDidEndEditing(textFieldValueRed, sliderRed, valueRed)
        case textFieldValueGreen:
            actionAfterDidEndEditing(textFieldValueGreen, sliderGreen, valueGreen)
        default:
            actionAfterDidEndEditing(textFieldValueBlue, sliderBlue, valueBlue)
        }
        setСolorForScreen()
    }
    
    private func actionAfterDidEndEditing(_ textField: UITextField,
                                          _ slider: UISlider,
                                          _ LabelColor: UILabel) {
        
        guard let value = Float(textField.text ?? ""),
              value <= 100,
              value >= 0 else {
                  textField.text = LabelColor.text
                  return showAlert(with: "Ошибка",
                                  and: "Введите число от 0 до 100")
              }
        slider.value = value
        LabelColor.text = getShortString(from: value)
    }
}

// MARK: Set Alert Controller
extension SettingColorViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
