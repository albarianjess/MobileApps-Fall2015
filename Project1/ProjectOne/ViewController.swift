//
//  ViewController.swift
//  ProjectOne
//
//  Created by Jessie Albarian on 9/26/15.
//  Copyright (c) 2015 jalbarian. All rights reserved.
//

import UIKit



class ArticlePage: UIViewController, UITextViewDelegate {
    
    
    //----------
    // Variables
    //----------
    @IBOutlet weak var topStoryText: UITextView!
    @IBOutlet weak var topStoryTitle: UILabel!
    @IBOutlet weak var articleNav: UINavigationBar!
    
    func updateTitle(){
        topStoryTitle.text = "COIN TOSS: Will CU Soccer or Volleyball Have a Better Season?"
    }
    
    
    
    func mainText(){
        topStoryText.text = "With teams in both sports riding momentum so far this season, CUI sports co-editors Sam Routhier and Jared Funk-Breay debate: which team will have a more impressive year? \n Jared Funk-Breay: Volleyball has a ton to be excited about this year, and it will have a world of opportunities to pick up quality conference wins with the Pac-12 placing seven of the top 18 teams in the AVCA Coaches poll. \n After a rocky start to the season, the Buffs have improved to 8-5 on the year and have a signature win against No. 17 Florida State. \n The team is gaining steam heading into conference play this week; it rattled off four wins in a row, and Gabby Simpson was named the Pac-12 Player of the Week. She had a career-high 21 kills against Montana State and averaged 4.71 kills per set in last week’s Omni Invitational tournament. \n While Colorado isn’t currently ranked in the top 25, it is receiving votes in the coaches poll. It should only take a win or two against a top-ranked Pac-12 opponent to catapult the Buffs into the rankings. They fell to Utah in its conference opener, but it has a huge chance to rebound against No. 6 Washington on Saturday."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainText()
        updateTitle()
    }
    
    func textViewDidChange(textView: UITextView) { //Handle the text changes here
        print(topStoryTitle.text);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class ViewController: UIViewController, UITextViewDelegate{
    
    //----------
    // Variables
    //----------

    @IBOutlet weak var topStoryButton: UIButton!
    @IBOutlet weak var topStoryLabel: UILabel!
    
    
    func updateTitles(){
        topStoryLabel.text = "COIN TOSS: Will CU Soccer or Volleyball Have a Better Season?"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitles()
    }

    
    func textViewDidChange(textView: UITextView) { //Handle the text changes here
        print(topStoryLabel.text); //the textView parameter is the textView where text was changed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

