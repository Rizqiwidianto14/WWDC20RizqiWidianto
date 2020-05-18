import UIKit
import AVFoundation

//MARK: Instruction For Level Two
public class InstructionTwo: UIViewController {
    
    // MARK: Variable Definition
    var instructionImages2 = ["Instruction1Level2", "Instruction2Level2"]
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
        let image = UIImage(named: instructionImages2[0])
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
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
        
        if stepIndex < instructionImages2.count {
            imageView.image = UIImage(named: instructionImages2[stepIndex])
        } else {
            let vc = LevelTwo()
            navigationController?.pushViewController(vc, animated: true)
                
            
        }
        
    }
    
    
}

