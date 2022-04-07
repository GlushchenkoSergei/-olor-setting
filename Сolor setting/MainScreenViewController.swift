//
//  MainScreenViewController.swift
//  Сolor setting
//
//  Created by mac on 04.04.2022.
//

import UIKit

protocol SettingColorViewControllerDelegate {
    func setNewColor(for backgroundColor: UIColor)
}

class MainScreenViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let setColorVC = segue.destination as? SettingColorViewController else {return}

        setColorVC.colorMainScreen = view.backgroundColor
        setColorVC.delegate = self
    }
}

extension MainScreenViewController: SettingColorViewControllerDelegate {
    func setNewColor(for backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
    }
}
