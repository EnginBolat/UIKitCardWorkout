//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Engin Bolat on 6.05.2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    var timer:Timer!
    var cars: [UIImage] = Deck.allValues
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonStyle()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func setupButtonStyle()  {
        for button in Buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cars.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
