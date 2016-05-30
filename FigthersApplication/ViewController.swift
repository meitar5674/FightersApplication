 //
//  ViewController.swift
//  FigthersApplication
//
//  Created by Meitar Basson on 29/05/2016.
//  Copyright © 2016 meitar. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var pOneHpBar: UILabel!
    @IBOutlet weak var pTwoHpBar: UILabel!
    @IBOutlet weak var pTwoImage: UIImageView!
    @IBOutlet weak var pOneImage: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var displayBar: UITextField!
    @IBOutlet weak var playerTwoAttack: UIButton!
    @IBOutlet weak var PlayerOneAttack: UIButton!
    
    var player1: Knight!
    var player2: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }


    @IBAction func ResetGame(sender: AnyObject) {
        if(!player2.isAlive() || !player1.isAlive()){
            startGame()
        }
    }
    
    @IBAction func pOneAttack(btn: UIButton) {
        PlayerOneAttack.hidden = true
        playerTwoAttack.hidden = false
        if player2.isAlive(){
            player2.hp =  player1.Attack(player2.hp)
        }
        if someoneDied(){}
        pTwoHpBar.text = "\(player2.hp)"
        disableButton(btn)
        
    }
        

    @IBAction func pTwoAttack(btn: UIButton) {
        PlayerOneAttack.hidden = false
        playerTwoAttack.hidden = true
        
        if player1.isAlive(){
            player1.hp = player2.Attack(player1.hp)
        }
        if someoneDied(){ }
        pOneHpBar.text = "\(player1.hp)"
        disableButton(btn)

    }
    
    
    func startGame(){
        player1 = Knight(criticalAtk: 20, name: "Tonus", hp: 200, att: 15, armor: 80)
        player2 = Enemy(name: "Dorp", hp: 300, att: 10)
        pOneHpBar.text = "\(player1.hp)"
        pTwoHpBar.text = "\(player2.hp)"
        pOneHpBar.hidden = false
        pOneImage.hidden = false
        pTwoImage.hidden = false
        pTwoHpBar.hidden = false
        resetButton.hidden = true
    }
    
    func someoneDied() -> Bool {
        if !player1.isAlive()
        {
            pOneImage.hidden = true
            pOneHpBar.hidden = true
            resetButton.hidden = false
        }else if !player2.isAlive(){
            pTwoImage.hidden = true
            pTwoHpBar.hidden = true
            resetButton.hidden = false
        }
        return false
    }
    
    func disableButton(btn: UIButton){
        btn.enabled = false
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(enableButton), userInfo: btn, repeats: false)
    }
    
    func enableButton(timer:NSTimer!) {
        
        let btn = timer.userInfo as? UIButton
        btn?.enabled = true
    }

}

