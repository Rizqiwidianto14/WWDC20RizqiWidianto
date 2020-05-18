import UIKit
import AVFoundation

//MARK: Instruction For Level Three
public class InstructionThree: UIViewController {
    
    // MARK: Variable Definition
    var instructionImages3 = ["Instruction1Level3", "Instruction2Level3"]
    var stepIndex = 0
    var imageView: UIImageView!
    var playButton2: UIButton!

    //MARK: Variable for Sound
    var soundURI: URL?
    var audioPlayer = AVAudioPlayer()
   
    public override func viewDidLoad(){
        
        // MARK: Setting Up The UI View
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        
        //MARK: Setting Up The Background
        let image = UIImage(named: instructionImages3[0])
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        imageView.isUserInteractionEnabled = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        //MARK: Go To Next Instruction
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextImage(_:)))
        imageView.addGestureRecognizer(tap)
        
    }
    
    
    
    //MARK: Setting Up Next Instruction
    @objc public func nextImage(_ sender: UITapGestureRecognizer){
        
        stepIndex += 1
        
        if stepIndex < instructionImages3.count {
            imageView.image = UIImage(named: instructionImages3[stepIndex])
        } else {
            let vc = LevelThree()
            navigationController?.pushViewController(vc, animated: true)
                
            
        }
        
    }
    
    
}


