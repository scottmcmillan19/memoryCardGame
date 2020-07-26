//
//  easyViewController.swift
//  memoryGame
//
//  Created by Scott McMillan on 7/14/20.
//  Copyright © 2020 Scott McMillan. All rights reserved.
//

import UIKit

class easyViewController: UIViewController {
    
    
    @IBOutlet weak var timer: UILabel!
    var oneUp = false
    // out of range values
    var numUp = 55
    var cardUp = 16
    // so the user doesn't click a card when it's changing
    var processing = false
    var done = Array<Bool>(repeating: false, count: 16)
    var score = 8

    @IBOutlet var cardCollection: Array<UIButton>?

    // when a match isn't made, change pic not activated in main fcn to back
    func changeSecondPic(_ cardNum: Int) {
        let image = UIImage(named: "back")
        cardCollection![cardNum].setImage(image, for: UIControl.State.normal)
    }

    // when match is made, hide the card not activated in the main function
    func hideSecond(_ cardNum: Int) {
        score -= 1
        let image = UIImage(named: "done")
        cardCollection![cardNum].setImage(image, for: UIControl.State.normal)
        done[cardNum] = true

        if (score == 0) {
          performSegue(withIdentifier: "gameOver", sender: self)
        }
    }

    func cardBtn(_ cardNum: Int) {
        // if user clicks a card while another match
        // is processed or if that match has been made
        if (processing || done[cardNum]) {
            return
        }
        // first card picked in a pair
        if (!oneUp) {
            let image = UIImage(named: "\(nums[cardNum])")
            cardCollection![cardNum].setImage(image, for: UIControl.State.normal)
            oneUp = true
            numUp = nums[cardNum]
            cardUp = cardNum
        }
        else {
            // this is when a match has been made
            if (numUp == nums[cardNum] && cardUp != cardNum) {
                done[cardNum] = true
                let cardImg = UIImage(named: "\(nums[cardNum])")
                cardCollection![cardNum].setImage(cardImg, for: UIControl.State.normal)
                processing = true
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (Timer) in
                    let image = UIImage(named: "done")
                    self.cardCollection![cardNum].setImage(image, for: UIControl.State.normal)

                    self.hideSecond(self.cardUp)
                    self.oneUp = false
                    self.numUp = 55
                    self.cardUp = 16
                    self.processing = false
                }
            }
                // if clicked same card twice
            else if (cardUp == cardNum) {
                return
            }
                // when a match isn't made and there is already a card up
            else {
                processing = true
                let image = UIImage(named: "\(nums[cardNum])")
                cardCollection![cardNum].setImage(image, for: UIControl.State.normal)
                oneUp = false
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (Timer) in
                    let image = UIImage(named: "back")
                    self.cardCollection![cardNum].setImage(image, for: UIControl.State.normal)
                    self.changeSecondPic(self.cardUp)
                    self.numUp = 55
                    self.cardUp  = 16
                    self.processing = false
                }
            }
        }
    }

    @IBAction func card0Btn(_ sender: Any) {
        cardBtn(0)
    }
    @IBAction func card1Btn(_ sender: Any) {
        cardBtn(1)
    }
    @IBAction func card2Btn(_ sender: Any) {
        cardBtn(2)
    }
    @IBAction func card3Btn(_ sender: Any) {
        cardBtn(3)
    }
    @IBAction func card4Btn(_ sender: Any) {
        cardBtn(4)
    }
    @IBAction func card5Btn(_ sender: Any) {
        cardBtn(5)
    }
    @IBAction func card6Btn(_ sender: Any) {
        cardBtn(6)
    }
    @IBAction func card7Btn(_ sender: Any) {
        cardBtn(7)
    }
    @IBAction func card8Btn(_ sender: Any) {
        cardBtn(8)
    }
    @IBAction func card9Btn(_ sender: Any) {
        cardBtn(9)
    }
    @IBAction func card10Btn(_ sender: Any) {
        cardBtn(10)
    }
    @IBAction func card11Btn(_ sender: Any) {
        cardBtn(11)
    }
    @IBAction func card12Btn(_ sender: Any) {
        cardBtn(12)
    }
    @IBAction func card13Btn(_ sender: Any) {
        cardBtn(13)
    }
    @IBAction func card14Btn(_ sender: Any) {
        cardBtn(14)
    }
    @IBAction func card15Btn(_ sender: Any) {
        cardBtn(15)
    }

    var nums: Array<Int> = Array(repeating: 0, count: 16)
    var time = 90
    override func viewDidLoad() {
        super.viewDidLoad()
        // count down the timer
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        // creating the select deck for this game
        for n in 0...7 {
            var found = false
            while (!found) {
                let rand = Int.random(in: 1...52)
                var count = 0
                for num in nums {
                    if (rand != num) {
                        count += 1
                    }
                    else {
                        break
                    }
                }
                if (count == 16) {
                    found = true
                    nums[n] = rand
                    nums[n + 8] = rand
                }
            }
        }

        nums.shuffle()

        // Do any additional setup after loading the view.
    }
    // count down timer
    @objc func update() {
        if (time > 0) {
            timer.text = ":\(time)"
            time -= 1
        }
        else {
            performSegue(withIdentifier: "lost", sender: self)
        }
    }

    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
