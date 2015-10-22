//
//  ViewController.swift
//  Lab7
//
//  Created by Jessie Albarian on 10/16/15.
//  Copyright (c) 2015 Albarian. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate,
AVAudioRecorderDelegate {

    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.caf"
    
    
    
    
    @IBOutlet weak var recordButt: UIButton!
    @IBOutlet weak var playButt: UIButton!
    @IBOutlet weak var stopButt: UIButton!
    
    @IBAction func recordAudio(sender: AnyObject) {
        if audioRecorder?.recording == false{
            playButt.enabled = false
            stopButt.enabled = true
            
            audioRecorder?.record()
        }
    }
    

    
    @IBAction func playAudio(sender: AnyObject) {
        if audioRecorder?.recording == false{
            stopButt.enabled = true
            recordButt.enabled = false
            var error: NSError?
            
            //create the AVAudioPlayer instance
            audioPlayer=AVAudioPlayer(contentsOfURL: audioRecorder?.url,
                error: &error)
            
            //test for error
            if let err = error {
                println("AVAudioPlayer error: \(err.localizedDescription)")
            } else {
                audioPlayer?.delegate=self //sets the delegate
                audioPlayer?.play() //plays audio file
            }
        }
    }
    
    
    
    @IBAction func stopAudio(sender: AnyObject) {
        stopButt.enabled = false
        playButt.enabled = true
        recordButt.enabled = true
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    
    
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully
        flag: Bool) {
            recordButt.enabled = true
            stopButt.enabled = false
    }
    
    
    
    override func viewDidLoad() {
        //disable buttons since no audio has been recorded
        playButt.enabled = false;
        stopButt.enabled = false;

        let dirPath =
        NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let docDir = dirPath[0] as! String //documents directory
        let audioFilePath = docDir.stringByAppendingPathComponent(fileName)
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)

        let recordSettings = [AVEncoderAudioQualityKey:
            AVAudioQuality.Min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey:
            2, AVSampleRateKey: 44100.0]
        var error : NSError?
        audioRecorder = AVAudioRecorder(URL: audioFileURL, settings:
            recordSettings as [NSObject : AnyObject], error: &error)

        if let err = error {
            println("AVAudioRecorder error: \(err.localizedDescription)")
        } else {
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        }
        super.viewDidLoad()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

