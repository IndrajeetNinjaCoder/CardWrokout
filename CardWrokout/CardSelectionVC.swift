//
//  CardSelectionVC.swift
//  CardWrokout
//
//  Created by test on 03/12/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
//    @IBOutlet var stopButton: UIButton!         // buttons[0]
//    @IBOutlet var restartButton: UIButton!      // buttons[1]
//    @IBOutlet var rulesButton: UIButton!        // buttons[2]
    
    
    var cards: [UIImage] = Card.allValues
    
    
    var timer: Timer?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        
        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop button tapped")
        timer?.invalidate()
    }
    
  
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        startTimer()
    }
    
 
    
    
    
}
