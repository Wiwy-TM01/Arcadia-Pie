//
//  MainViewController.swift
//  Arcadia Pie
//
//  Created by Edward A. Barber on 8/5/20.
//  Copyright © 2020 Wiwy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.delegate = self
    }
}

// MARK: - Delegates

extension MainViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        guard self.navigationBar == bar as? UINavigationBar else {
            return bar.barPosition
        }
        return UIBarPosition.topAttached
    }
}
