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
    @IBOutlet weak var topStoryTitle: UILabel!
    @IBOutlet weak var articleNav: UINavigationBar!
    @IBOutlet weak var topStoryText: UITextView!
    
    
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//---------------------------------------
//  Main Page Class: Main View Controller
//---------------------------------------
class ViewController: UIViewController, UITextViewDelegate{
    
    //----------
    // Variables
    //----------
    @IBOutlet weak var topStoryButton: UIButton!    //main button that covers entire top story area
    @IBOutlet weak var topStoryLabel: UILabel!      //main article title
    @IBOutlet weak var articleOne: UIImageView!     //article one image
    @IBOutlet weak var articleTwo: UIImageView!     //article two image
    @IBOutlet weak var articleOneLabel: UILabel!    //article 1 description
    
    @IBOutlet weak var articleTwoLabel: UILabel!    //article 2 description

    @IBOutlet weak var articleOneDate: UILabel!     //article 1 date
    @IBOutlet weak var articleTwoDate: UILabel!     //article 2 date
    
    @IBOutlet weak var articleOneDes: UILabel!
    @IBOutlet weak var articleTwoDes: UILabel!
    
    
    //---------------------
    // Make images circular
    //---------------------
    func circleImages(){
        articleOne.layer.cornerRadius = articleOne.frame.size.height/2;
        articleOne.layer.masksToBounds = true;
        articleOne.layer.borderWidth = 0;
        articleTwo.layer.cornerRadius = articleTwo.frame.size.height/2;
        articleTwo.layer.masksToBounds = true;
        articleTwo.layer.borderWidth = 0;
    }
    
    
    //-------------
    // Update dates
    //-------------
    func updateDates(){
        articleOneDate.text = "09/26/15"
        articleTwoDate.text = "09/04/15"
    }
    
    
    //---------------------------
    // Update titles for articles
    //---------------------------
    func updateTitles(){
        topStoryLabel.text = "COIN TOSS: Will CU Soccer or Volleyball Have a Better Season?"
        articleOneLabel.text = "COLORADO FOOTBALL GROWS UP IN WIN OVER RAMS"
        articleTwoLabel.text = "MUSIC PREVIEW: FOX AND BOULDER THEATER"
    }
    
    
    //--------------------
    // Update descriptions
    //--------------------
    func updateDescription(){
        articleOneDes.text = "Defensive stand in overtime shows Buffs can find a way to win."
        articleTwoDes.text = "Funk and jazz make a big showing in Boulder this week at the Fox and Boulder Theater."
    }
    
    
    //--------------
    // viewDidLoad()
    //--------------
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitles()
        circleImages()
        //updateDescription()
        updateDates()
    }
    
    
    //----------------------------------
    // is called every time view pops up
    //----------------------------------
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    //------------------------------
    // Resets view to original state
    //------------------------------
    func refreshUI(){
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

