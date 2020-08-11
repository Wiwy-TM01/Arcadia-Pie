//
//  Created by Edward A. Barber on 8/5/20.
//  Copyright © 2020 Wiwy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: constants.arcadiaCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: constants.arcadiaCell)
        
        navigationBar.delegate = self
        collectionView.delegate = self
        
        collectionView.dataSource = self
    }
}

// MARK: - Data Source

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: constants.arcadiaCell, for: indexPath) as? ArcadiaCell else { return UICollectionViewCell() }
        
        cell.titleLabel.text = "\(indexPath.section) : \(indexPath.row)"
        
        return cell
    }
}

// MARK: - Delegates

extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // Insets handled in storyboard
        
        let screenSize = view.frame.size
        let screenWidth = screenSize.width / 2
        let screenHeight = screenSize.height / 2
        let insetOffset: CGFloat = 2

        return CGSize(width: screenWidth - insetOffset, height: screenHeight)
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}

extension MainViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        guard self.navigationBar == bar as? UINavigationBar else {
            return bar.barPosition
        }
        return UIBarPosition.topAttached
    }
}
