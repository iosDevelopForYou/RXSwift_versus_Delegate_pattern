//
//  SceneDelegate.swift
//  RX_versus_delegate
//
//  Created by Marat Guseynov on 24.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
             
             // инициализируем наше окно
             window = UIWindow(frame: windowScene.coordinateSpace.bounds)
             window?.windowScene = windowScene
             
             // инициализируем наш главный view controller
             let viewController = ProfileViewController()
             let navigationController = UINavigationController(rootViewController: viewController)
             
             window?.rootViewController = navigationController
             window?.makeKeyAndVisible()
    }



}

