import UIKit

//MARK: Component Cell
public class ComponentsCell: UICollectionViewCell {
    let image: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(x: img.frame.origin.x, y: img.frame.origin.y, width: 50, height: 50)
        return img
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

