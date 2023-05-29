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
        tabBarController?.tabBar.isHidden = true
           let animationView = LottieAnimationView(name: "launch")
        animationView.center = self.view.center
           self.view.addSubview(animationView)
           animationView.play()
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
         let homeVC = self.storyboard?.instantiateViewController(identifier: "home") as! HomeViewController
            self.navigationController?.pushViewController(homeVC, animated: true)
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
