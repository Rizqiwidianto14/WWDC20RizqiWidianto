import UIKit
import PlaygroundSupport
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: View Variables for Home Screen
    var homeBackground: UIImageView!
    var playButton: UIButton!
    
    //MARK: Sounds Variables
    var soundURL: URL?
    var playAudio = AVAudioPlayer()
    var backsoundURL: URL?
    var backSoundplayAudio = AVAudioPlayer()
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        navigationController?.isNavigationBarHidden = true
    
        
        //MARK: Setting Up Home Background
        homeBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        homeBackground.image = UIImage(named: "HomeBackground.png")
        homeBackground.contentMode = .scaleAspectFit
        view.addSubview(homeBackground)
        
        
        //MARK: Setting Up The Play Button in the Center of Home Background
        playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        playButton.setImage(UIImage(named: "PlayButton.png"), for: .normal)
        playButton?.center = homeBackground.center
        playButton.frame.origin.y += 50
        playButton.addTarget(self, action: #selector(playButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(playButton)
        
        // To Animate the Play Button
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [.calculationModeCubic, .autoreverse, .repeat, .allowUserInteraction], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.playButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
        
        })
        
        // MARK: Setting Up The Whole Game Soundtrack
        self.playBackSound(file: "backsound", fileExtension: "wav")
    }
    
    //MARK: Play Button's Action
    @objc func playButtonTapped(_ sender: UIButton){
        tapSound()
        let vc = Instruction()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Setting Up Sound Effects
    public func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let url = soundURL else {return}
            playAudio = try AVAudioPlayer(contentsOf: url)
            playAudio.play()
        } catch {
        }
    }
    
    public func tapSound(){
        self.playSound(file: "applause", fileExtension: "mp3")
    }
    
    public func playBackSound(file: String, fileExtension: String){
        backsoundURL = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = backsoundURL else {return}
            backSoundplayAudio = try AVAudioPlayer(contentsOf: uri)
            backSoundplayAudio.numberOfLoops = -1
            backSoundplayAudio.play()
        } catch {
        }
    }
}

// MARK: Setting Up The View Controller
let viewController = ViewController()
viewController.preferredContentSize = CGSize(width: 581, height: 640)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = UINavigationController(rootViewController: viewController)

