//
//  LaunchScreenViewController.swift
//  Sportify
//
//  Created by ME on 29/05/2023.
//

import UIKit
import Lottie
class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
           let animationView = LottieAnimationView(name: "launch")
        animationView.center = self.view.center
           self.view.addSubview(animationView)
           animationView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "mainScreen")
                    self.navigationController?.setViewControllers([mainVC], animated: true)
                }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
