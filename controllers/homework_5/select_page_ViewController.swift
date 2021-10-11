//
//  select_page_ViewController.swift
//  vk_server
//
//  Created by Grisha Pospelov on 11.10.2021.
//

import UIKit

class select_page_ViewController: UIViewController {
//    var friends: [Friend] = []
    

    @IBAction func actions_1(_ sender: Any) {
        let action1VC = action1Controller()
        self.navigationController?.pushViewController(action1VC, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func actions_2(_ sender: Any) {
        let action2VC = action2Controller()
       self.navigationController?.pushViewController(action2VC, animated: true)
    }
    
    @IBAction func actions_3(_ sender: Any) {
        let action3VC = action3ViewController()
        self.navigationController?.pushViewController(action3VC, animated: true)
        
    }
    @IBAction func actions_4(_ sender: Any) {
        let action4VC = action4Controller()
        self.navigationController?.pushViewController(action4VC, animated: true)
    }
}


