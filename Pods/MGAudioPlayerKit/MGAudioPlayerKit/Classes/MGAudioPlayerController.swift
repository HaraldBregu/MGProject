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
import SnapKit
import FirebaseCore
import GoogleMobileAds


public class MGAudioPlayerController: UIViewController {
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
    private var audioPlayer: AVAudioPlayer!
    
    private var isLiked: Bool = false
    private var isRepeat: Bool = false
    private var isShuffle: Bool = false
    private var timer: Timer!

    public var delegate: MGAudioPlayerControllerDelegate?
    public var dataSource: MGAudioPlayerControllerDataSource?
    public var assets: MGAudioPlayerAsset!
    public var item: MGAudioPlayerItem!

    var bannerView: GADBannerView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = assets.string.title
        navigationItem.title = assets.string.navigationBarTitle
        
        view.backgroundColor = assets.color.view
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationItem.largeTitleDisplayMode = .never

        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
            navigationItem.leftItemsSupplementBackButton = true
        }
        
        if let items = dataSource?.rightBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.rightBarButtonItems = items
        }

        playerImageView.layer.cornerRadius = 8
        
        startAudioPlayer()
        startAudioSession()
        startTimer()
        updateView()
        
        slider.value = 0.0
        slider.minimumValue = 0.0
        slider.maximumValue = Float(audioPlayer.duration)
        slider.minimumTrackTintColor = assets.color.sliderMinimumTrackColor
        slider.setThumbImage(thumbImage, for: .normal)
        slider.setThumbImage(thumbImageSelected, for: .highlighted)
        slider.setThumbImage(thumbImageSelected, for: .selected)

        titleLabel.textColor = assets.color.playerTitle
        if let font = assets.font.playerTitle {
            titleLabel.font = font
        }
        
        authorLabel.textColor = assets.color.playerSubtitle
        if let font = assets.font.playerSubtitle {
            authorLabel.font = font
        }
        
        yearLabel.textColor = assets.color.playerYearPub
        if let font = assets.font.playerYearPub {
            yearLabel.font = font
        }
        
        currentTimeLabel.textColor = assets.color.timeProgress
        totalTimeLabel.textColor = assets.color.timeProgress
        
        currentTimeLabel.text = audioTimeProgress
        totalTimeLabel.text = audioTimeRemain

        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)

        backwardButton.setImage(stepBackwardImage, for: .normal)
        backwardButton.setImage(stepBackwardImage, for: .highlighted)
        backwardButton.setImage(stepBackwardImage, for: .selected)

        forwardButton.setImage(stepForwardImage, for: .normal)
        forwardButton.setImage(stepForwardImage, for: .highlighted)
        forwardButton.setImage(stepForwardImage, for: .selected)

        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)

        shareButton.setImage(shareImage, for: .normal)
        shareButton.setImage(shareImage, for: .highlighted)
        shareButton.setImage(shareImage, for: .selected)

        optionButton.accessibilityIdentifier = "OPTION"
        optionButton.setImage(optionImage, for: .normal)
        optionButton.setImage(optionImage, for: .highlighted)
        optionButton.setImage(optionImage, for: .selected)

        repeatButton.setImage(repeatImageUnactive, for: .normal)
        repeatButton.setImage(repeatImageUnactive, for: .highlighted)
        repeatButton.setImage(repeatImageUnactive, for: .selected)

        shuffleButton.setImage(shuffleImageUnactive, for: .normal)
        shuffleButton.setImage(shuffleImageUnactive, for: .highlighted)
        shuffleButton.setImage(shuffleImageUnactive, for: .selected)
        
        if let assets = assets, assets.data.enableAds == true, assets.data.adsUnitId.count > 0 {
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            view.addSubview(bannerView)
            bannerView.snp.makeConstraints { make in
                make.bottom.equalTo(self.view)
                make.leading.equalTo(self.view)
                make.trailing.equalTo(self.view)
            }
            bannerView.adUnitID = assets.data.adsUnitId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shadowImage = UIImage()
        audioPlayer.play()
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)
    }
        
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.shadowImage = nil
        audioPlayer.pause()
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .normal)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .highlighted)
        playPauseButton.setImage(audioPlayer.isPlaying ? pauseImage : playImage, for: .selected)
    }
    
    @IBAction func playPause(_ sender: UIButton) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            playPauseButton.setImage(playImage, for: .normal)
            playPauseButton.setImage(playImage, for: .highlighted)
            playPauseButton.setImage(playImage, for: .selected)
        } else {
            audioPlayer.currentTime = TimeInterval(slider.value)
            audioPlayer.play()
            if timer.isValid == false {
                startTimer()
            }
            playPauseButton.setImage(pauseImage, for: .normal)
            playPauseButton.setImage(pauseImage, for: .highlighted)
            playPauseButton.setImage(pauseImage, for: .selected)
        }
    }
    
    @IBAction func backward(_ sender: UIButton) {
        audioPlayer.stop()
        item = prevAudio ?? item
        startAudioPlayer()
        audioPlayer.play()
        updateView()
    }
    
    @IBAction func forward(_ sender: UIButton) {
        audioPlayer.stop()
        item = nextAudio ?? item
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
        let items = [item.title!, item.author!, item.thumbUrlString!]
        let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityIndicator, animated: true)
        if let popover = activityIndicator.popoverPresentationController {
            popover.sourceView = view
            popover.sourceRect = sender.bounds
        }
    }
    
    @IBAction func like(_ sender: UIButton) {
        isLiked = !isLiked
        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)
    }
    
    @IBAction func options(_ sender: UIButton) {
        delegate?.controller(self, didTapButton: sender)
    }
    
    @IBAction func `repeat`(_ sender: UIButton) {
        isRepeat = !isRepeat
        let image = isRepeat ? repeatImageActive :  repeatImageUnactive
        repeatButton.setImage(image, for: .normal)
        repeatButton.setImage(image, for: .highlighted)
        repeatButton.setImage(image, for: .selected)
    }
    
    @IBAction func shuffle(_ sender: UIButton) {
        isShuffle = !isShuffle
        let image = isShuffle ? shuffleImageActive :  shuffleImageUnactive
        shuffleButton.setImage(image, for: .normal)
        shuffleButton.setImage(image, for: .highlighted)
        shuffleButton.setImage(image, for: .selected)
    }
    
    @objc func navigationItemAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }

}

extension MGAudioPlayerController: AVAudioPlayerDelegate {
   
    public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if isRepeat {
            audioPlayer.stop()
            startAudioPlayer()
            audioPlayer.play()
            updateView()
        } else {
            audioPlayer.stop()
            item = nextAudio ?? item
            startAudioPlayer()
            audioPlayer.play()
            updateView()
        }
    }
    
}

extension MGAudioPlayerController {
    
    private func startAudioPlayer() {
        let bundle = assets.data.bundle
        guard let path = bundle.path(forResource: item.filename, ofType: item.filetype) else { return }
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
        playerImageView.sd_setImage(with: URL(string: item.thumbUrlString))
        titleLabel.text = item.title
        authorLabel.text = item.author
        yearLabel.text = item.pubYear
        slider.maximumValue = Float(audioPlayer.duration)
    }
    
    private var nextAudio:MGAudioPlayerItem? {
        let items = assets.data.items
        let newAudios = isShuffle ? items?.shuffled() : items
        return newAudios?[nextAudioIndex] ?? items?.first
    }
    
    private var prevAudio:MGAudioPlayerItem? {
        let items = assets.data.items
        return items?[prevAudioIndex] ?? items?.first
    }
    
    private var currentAudioIndex:Int {
        return assets.data.items?.index(where: { $0 == item }) ?? 0
    }
    
    private var nextAudioIndex:Int {
        let items = assets.data.items ?? []
        let nextIdx = currentAudioIndex + 1
        let indexIsValid = items.indices.contains(nextIdx)
        return indexIsValid ? nextIdx : 0
    }
    
    private var prevAudioIndex:Int {
        let items = assets.data.items ?? []
        let nextIdx = currentAudioIndex - 1
        let indexIsValid = items.indices.contains(nextIdx)
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
    
    private var thumbImage: UIImage {
        return assets.image.thumbNormal
    }
    
    private var thumbImageSelected: UIImage {
        return assets.image.thumbSelected
    }

    private var playImage: UIImage {
        return assets.image.play
    }

    private var pauseImage: UIImage {
        return assets.image.pause
    }
    
    private var stepBackwardImage: UIImage {
        return assets.image.stepBackward
    }

    private var stepForwardImage: UIImage {
        return assets.image.stepForward
    }

    private var shuffleImageUnactive: UIImage {
        return assets.image.shuffleUnactive
    }

    private var shuffleImageActive: UIImage {
        return assets.image.shuffleActive
    }

    private var repeatImageUnactive: UIImage {
        return assets.image.repeatUnactive
    }

    private var repeatImageActive: UIImage {
        return assets.image.repeatActive
    }

    private var heartImage: UIImage {
        return assets.image.heartActive
    }

    private var heart0Image: UIImage {
        return assets.image.heartUnactive
    }

    private var optionImage: UIImage {
        return assets.image.option
    }

    private var shareImage: UIImage {
        return assets.image.share
    }
    
}

extension MGAudioPlayerController: GADBannerViewDelegate {
    
    /// Tells the delegate an ad request loaded an ad.
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        //print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        //print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    public func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        //print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    public func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    public func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    public func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        //print("adViewWillLeaveApplication")
    }
    
}
