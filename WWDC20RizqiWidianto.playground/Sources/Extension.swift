import Foundation
import UIKit

//MARK: Extension for Level One
extension LevelOne:  UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate{
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ComponentsCell
        myCell.tag = indexPath.row
        myCell.image.image = UIImage(named: "\(self.componentItems[indexPath.row])Collection")
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        pan.cancelsTouchesInView = false
        myCell.addGestureRecognizer(pan)
        return myCell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return componentItems.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ComponentsCell
        cell?.image.image = UIImage(named: "\(self.componentItems[indexPath.row])Collection")
        let itemPosition = CGPoint(x: view.center.x, y: (view.center.y - 200))
        showComponentSelected(itemAt: indexPath.row, position: itemPosition)
    }
    
    
}
