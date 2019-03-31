// 
//  MGAudioPlayerController.swift
//
//  Created by harald bregu on 30/03/2019.
//  Copyright © 2019 Dream Building Company. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import AVFoundation
import SDWebImage


class MGAudioPlayerController: UIViewController {
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var totalTimeLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var backwardButton: UIButton!
    @IBOutlet var shuffleButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var repeatButton: UIButton!
    @IBOutlet var optionButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var slider: UISlider!
    private var audioPlayer:AVAudioPlayer!
    public var audios:[MGAudioPlayerData]!
    public var currentAudio:MGAudioPlayerData!
    private var isLiked:Bool = false
    private var isRepeat:Bool = false
    private var isShuffle:Bool = false
    private var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "mg.audioplayer.nav.title".localized
//        navigationItem.title = "mg.audioplayer.nav.title".localized
//        view.backgroundColor = MGGeneral.View.Theme.dark
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = MGGeneral.NavBar.Theme.dark
//        navigationController?.navigationBar.tintColor = MGGeneral.NavBar.Theme.light
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // ImageView
        playerImageView.layer.cornerRadius = 8
        
        // Start player
        startAudioPlayer()
        startAudioSession()
        
        // Timer
        startTimer()
        
        // Update view
        updateView()
        
        // Slider
        slider.value = 0.0
        slider.minimumValue = 0.0
        slider.maximumValue = Float(audioPlayer.duration)
//        slider.minimumTrackTintColor = primaryColor
//        slider.setThumbImage(thumbImage, for: .normal)
//        slider.setThumbImage(thumbImageSelected, for: .highlighted)
//        slider.setThumbImage(thumbImageSelected, for: .selected)
//
//        // Title Author label
//        titleLabel.textColor = secondaryColor
//        authorLabel.textColor = primaryColor
//
//        // Duration label
//        currentTimeLabel.textColor = primaryColor
//        totalTimeLabel.textColor = primaryColor
//        currentTimeLabel.text = audioTimeProgress
//        totalTimeLabel.text = audioTimeRemain
//
//        // Play Pause button
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)
//
//        // Back button
//        backwardButton.setImage(stepBackwardImage, for: .normal)
//        backwardButton.setImage(stepBackwardImage, for: .highlighted)
//        backwardButton.setImage(stepBackwardImage, for: .selected)
//
//        // Forward button
//        forwardButton.setImage(stepForwardImage, for: .normal)
//        forwardButton.setImage(stepForwardImage, for: .highlighted)
//        forwardButton.setImage(stepForwardImage, for: .selected)
//
//        // Like button
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)
//
//        // Share button
//        shareButton.setImage(shareImage, for: .normal)
//        shareButton.setImage(shareImage, for: .highlighted)
//        shareButton.setImage(shareImage, for: .selected)
//
//        // Option button
//        optionButton.setImage(optionImage, for: .normal)
//        optionButton.setImage(optionImage, for: .highlighted)
//        optionButton.setImage(optionImage, for: .selected)
//
//        // Repeat button
//        repeatButton.setImage(repeatImageUnactive, for: .normal)
//        repeatButton.setImage(repeatImageUnactive, for: .highlighted)
//        repeatButton.setImage(repeatImageUnactive, for: .selected)
//
//        // Shuffle button
//        shuffleButton.setImage(shuffleImageUnactive, for: .normal)
//        shuffleButton.setImage(shuffleImageUnactive, for: .highlighted)
//        shuffleButton.setImage(shuffleImageUnactive, for: .selected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.shadowImage = UIImage()
        audioPlayer.play()
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = nil
        audioPlayer.pause()
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
//        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK - Funtions
    
    @IBAction func playPause(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
//            playPauseButton.setImage(playImage, for: .normal)
//            playPauseButton.setImage(playImage, for: .highlighted)
//            playPauseButton.setImage(playImage, for: .selected)
        } else {
            audioPlayer.currentTime = TimeInterval(slider.value)
            audioPlayer.play()
            if timer.isValid == false {
                startTimer()
            }
//            playPauseButton.setImage(pauseImage, for: .normal)
//            playPauseButton.setImage(pauseImage, for: .highlighted)
//            playPauseButton.setImage(pauseImage, for: .selected)
        }
    }
    
    @IBAction func backward(_ sender: UIButton) {
        audioPlayer.stop()
        currentAudio = prevAudio ?? currentAudio
        startAudioPlayer()
        audioPlayer.play()
        updateView()
    }
    
    @IBAction func forward(_ sender: UIButton) {
        audioPlayer.stop()
        currentAudio = nextAudio ?? currentAudio
        startAudioPlayer()
        audioPlayer.play()
        updateView()
    }
    
    @IBAction func changeCurrentTime(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(slider.value)
        currentTimeLabel.text = sliderTimeProgress
        totalTimeLabel.text = sliderTimeRemain
        if self.timer.isValid {
            self.timer.invalidate()
        }
    }
    
    @IBAction func finishUpChangeCurrentTime(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(slider.value)
        startTimer()
    }
    
    @IBAction func finishOutChangeCurrentTime(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(slider.value)
        startTimer()
    }
    
    @IBAction func share(_ sender: UIButton) {
        let items = [currentAudio.title!, currentAudio.author!, currentAudio.thumbUrlString!]
        let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityIndicator, animated: true)
    }
    
    @IBAction func like(_ sender: UIButton) {
        isLiked = !isLiked
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)
    }
    
    @IBAction func options(_ sender: UIButton) {
        
//        let alertController = UIAlertController(title: "mg.audioplayer.btm.option.sheet.title".localized, message: "mg.audioplayer.btm.option.sheet.description".localized, preferredStyle: .actionSheet)
//
//        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.one".localized, style: .default, handler: { (action) in
//
//        }))
//
//        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.two".localized, style: .default, handler: { (action) in
//
//        }))
//
//        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.three".localized, style: .default, handler: { (action) in
//
//        }))
//
//        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.cancel".localized, style: .cancel, handler: { (action) in
//
//        }))
//
//        present(alertController, animated: true) { }
    }
    
    @IBAction func `repeat`(_ sender: UIButton) {
        isRepeat = !isRepeat
//        let image = isRepeat ? repeatImageActive :  repeatImageUnactive
//        repeatButton.setImage(image, for: .normal)
//        repeatButton.setImage(image, for: .highlighted)
//        repeatButton.setImage(image, for: .selected)
    }
    
    @IBAction func shuffle(_ sender: UIButton) {
        isShuffle = !isShuffle
//        let image = isShuffle ? shuffleImageActive :  shuffleImageUnactive
//        shuffleButton.setImage(image, for: .normal)
//        shuffleButton.setImage(image, for: .highlighted)
//        shuffleButton.setImage(image, for: .selected)
    }
    
}

extension MGAudioPlayerController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if isRepeat {
            audioPlayer.stop()
            startAudioPlayer()
            audioPlayer.play()
            updateView()
        } else {
            audioPlayer.stop()
            currentAudio = nextAudio ?? currentAudio
            startAudioPlayer()
            audioPlayer.play()
            updateView()
        }
    }
}

extension MGAudioPlayerController {
    
    private func startAudioPlayer() {
        let bundle = Bundle(for: MGAudioPlayer.self)
        let path = bundle.path(forResource: currentAudio.filename, ofType: currentAudio.filetype)!
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.delegate = self
        } catch {
            
        }
    }
    
    private func startAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, policy: AVAudioSession.RouteSharingPolicy.default, options: AVAudioSession.CategoryOptions.allowBluetooth)
        } catch {
            
        }
    }
    
    private func updateView() {
        playerImageView.sd_setShowActivityIndicatorView(true)
        playerImageView.sd_setIndicatorStyle(.white)
        playerImageView.sd_setImage(with: URL(string: currentAudio.thumbUrlString))
        titleLabel.text = currentAudio.title
        authorLabel.text = currentAudio.author
        yearLabel.text = currentAudio.pubYear
        slider.maximumValue = Float(audioPlayer.duration)
    }
    
    private var nextAudio:MGAudioPlayerData? {
        let newAudios = isShuffle ? audios.shuffled() : audios
        return newAudios?[nextAudioIndex] ?? audios.first
    }
    
    private var prevAudio:MGAudioPlayerData? {
        return audios?[prevAudioIndex] ?? audios.first
    }
    
    private var currentAudioIndex:Int {
        return audios.index(where: { $0 == currentAudio }) ?? 0
    }
    
    private var nextAudioIndex:Int {
        let nextIdx = currentAudioIndex + 1
        let indexIsValid = audios.indices.contains(nextIdx)
        return indexIsValid ? nextIdx : 0
    }
    
    private var prevAudioIndex:Int {
        let nextIdx = currentAudioIndex - 1
        let indexIsValid = audios.indices.contains(nextIdx)
        return indexIsValid ? nextIdx : 0
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            self.slider.value = Float(self.audioPlayer.currentTime)
            self.currentTimeLabel.text = self.audioTimeProgress
            self.totalTimeLabel.text = self.audioTimeRemain
        }
    }
    
    private var audioTimeProgress:String {
        let duration = Int(audioPlayer.currentTime)
        let time = toHoursMinutesSeconds(seconds: duration)
        let min = time.min
        let minutes = String(min)
        let sec = time.sec
        let seconds = String(format: "%02d", sec)
        return minutes + ":" + seconds
    }
    
    private var sliderTimeProgress:String {
        let duration = Int(slider.value)
        let time = toHoursMinutesSeconds(seconds: duration)
        let min = time.min
        let minutes = String(min)
        let sec = time.sec
        let seconds = String(format: "%02d", sec)
        return minutes + ":" + seconds
    }
    
    private var audioTimeRemain:String {
        let duration = Int(audioPlayer.duration - audioPlayer.currentTime)
        let time = toHoursMinutesSeconds(seconds: duration)
        let min = time.min
        let minutes = String(min)
        let sec = time.sec
        let seconds = String(format: "%02d", sec)
        return minutes + ":" + seconds
    }
    
    private var sliderTimeRemain:String {
        let duration = Int(slider.maximumValue - slider.value)
        let time = toHoursMinutesSeconds(seconds: duration)
        let min = time.min
        let minutes = String(min)
        let sec = time.sec
        let seconds = String(format: "%02d", sec)
        return minutes + ":" + seconds
    }
    
    private func toHoursMinutesSeconds(seconds:Int) -> (h:Int, min:Int, sec:Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
}

extension MGAudioPlayerController {
    
//    private var playImage:UIImage {
//        let play = IoniconsType.play
//        let icon = FontType.ionicons(play)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var pauseImage:UIImage {
//        let iosPause = IoniconsType.pause
//        let icon = FontType.ionicons(iosPause)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var stepBackwardImage:UIImage {
//        let iosSkipbackward = IoniconsType.iosSkipbackward
//        let icon = FontType.ionicons(iosSkipbackward)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var stepForwardImage:UIImage {
//        let iosSkipforward = IoniconsType.iosSkipforward
//        let icon = FontType.ionicons(iosSkipforward)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var shuffleImageUnactive:UIImage {
//        let iosShuffle = IoniconsType.shuffle
//        let icon = FontType.ionicons(iosShuffle)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor.withAlphaComponent(0.4))
//    }
//
//    private var shuffleImageActive:UIImage {
//        let iosShuffle = IoniconsType.shuffle
//        let icon = FontType.ionicons(iosShuffle)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var repeatImageUnactive:UIImage {
//        let iosShuffle = IoniconsType.loop
//        let icon = FontType.ionicons(iosShuffle)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor.withAlphaComponent(0.4))
//    }
//
//    private var repeatImageActive:UIImage {
//        let iosShuffle = IoniconsType.loop
//        let icon = FontType.ionicons(iosShuffle)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var heartImage:UIImage {
//        let heartIcon = IoniconsType.iosHeart
//        let icon = FontType.ionicons(heartIcon)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor)
//    }
//
//    private var heart0Image:UIImage {
//        let heartIcon = IoniconsType.iosHeartOutline
//        let icon = FontType.ionicons(heartIcon)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor.withAlphaComponent(0.4))
//    }
//
//    private var optionImage:UIImage {
//        let moreIcon = IoniconsType.androidMoreHorizontal
//        let icon = FontType.ionicons(moreIcon)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor.withAlphaComponent(0.4), backgroundColor: .clear)
//    }
//
//    private var shareImage:UIImage {
//        let shareIcon = IoniconsType.androidShare
//        let icon = FontType.ionicons(shareIcon)
//        return UIImage(icon: icon, size: playerSize, textColor: secondaryColor.withAlphaComponent(0.4), backgroundColor: .clear)
//    }
//
//    private var thumbImage:UIImage {
//        let circleIcon = FASolidType.circle
//        let icon = FontType.fontAwesomeSolid(circleIcon)
//        return UIImage(icon: icon, size: thumbSizeNormal, textColor: primaryColor, backgroundColor: .clear)
//    }
//
//    private var thumbImageSelected:UIImage {
//        let circleIcon = FASolidType.circle
//        let icon = FontType.fontAwesomeSolid(circleIcon)
//        return UIImage(icon: icon, size: thumbSizeSelected, textColor: primaryColor, backgroundColor: .clear)
//    }
//
    private var thumbSizeNormal: CGSize {
        return CGSize(width: 10, height: 10)
    }
    
    private var thumbSizeSelected: CGSize {
        return CGSize(width: 15, height: 15)
    }
    
    private var playerSize:CGSize {
        return CGSize(width: 100, height: 100)
    }
//
//    private var primaryColor:UIColor {
//        return UIColor("#E21C3A")
//    }
    
    private var secondaryColor:UIColor {
        return UIColor.white
    }
    
}
