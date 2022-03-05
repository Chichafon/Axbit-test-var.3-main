//
//  ViewController.swift
//  Axbit test var.3
//
//  Created by 111 on 27.02.2022.
//

import UIKit

class WelcomeController: UIViewController {

    //MARK: - Properties

    @IBOutlet weak var welcomeScreenLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var welcomeScreenFirstTextField: UITextField!
    @IBOutlet weak var welcomeScreenSecondTextField: UITextField!
    @IBOutlet weak var welcomeScreenThirdTextField: UITextField!

    private lazy var firstName = ""
    private lazy var secondName = ""
    private lazy var thirdName = ""
    lazy var names = [String?]()

    //MARK: - Actions

    @IBAction func buttonAction(_ sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)

        firstName = welcomeScreenFirstTextField.text ?? "nil"
        secondName = welcomeScreenSecondTextField.text ?? "nil"
        thirdName = welcomeScreenThirdTextField.text ?? "nil"

        names.append(firstName)
        names.append(secondName)
        names.append(thirdName)
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if (welcomeScreenFirstTextField?.text != "" && welcomeScreenSecondTextField?.text != "" && welcomeScreenThirdTextField?.text != "") {
                button.isEnabled = true
            } else {
                button.setTitleColor(.gray, for: .disabled)
                button.isEnabled = false
            }
    }

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        button.isEnabled = false
    }
}
