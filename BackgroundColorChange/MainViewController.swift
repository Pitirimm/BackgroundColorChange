//
//  ViewController.swift
//  BackgroundColorChange
//
//  Created by Yuriy Martinovskiy on 06.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var viewColor: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingVC.color = viewColor.backgroundColor
        settingVC.delegate = self
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        guard segue.source is SettingsViewController else { return }
        }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        viewColor.backgroundColor = color
    }
    
    
}
