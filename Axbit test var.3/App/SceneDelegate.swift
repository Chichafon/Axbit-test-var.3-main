//
//  SceneDelegate.swift
//  Axbit test var.3
//
//  Created by 111 on 27.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true, _ userName: String? = nil) {
        guard let window = self.window else {
            return
        }

        window.rootViewController = vc

        UIView.transition(with: window,
                          duration: 0.4,
                          options: .curveEaseIn,
                          animations: nil)
    }
}

