//
//  AnimatePicsController.swift
//  VK
//
//  Created by Pauwell on 03.05.2021.
//

import UIKit

class AnimatePicsController: UIViewController {
    
   
    @IBOutlet weak var animatePics: UIImageView!
    
    var user: User?
    var interactionAnimator: UIViewPropertyAnimator!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        self.view.addGestureRecognizer(recognizer)
        
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
            switch recognizer.state {
            case .began:
                interactionAnimator = UIViewPropertyAnimator(duration: 1,
                                                             curve: .easeInOut,
                                                             animations: {
                                                                guard let _ = self.user,
                                                                      let array = self.user?.fotoArray
                                                                else { return }
                                                                                        
                                                                self.animatePics.image = array[0]
                                                                self.animatePics.frame = self.animatePics.frame.offsetBy(dx: 0, dy: 200)
                                                             })
                interactionAnimator.pauseAnimation()
                
            case .changed:
                let tranlation = recognizer.translation(in: self.view)
                interactionAnimator.fractionComplete = tranlation.y / 200
            case .ended:
                interactionAnimator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
                
            default: return
    }
  }
}
