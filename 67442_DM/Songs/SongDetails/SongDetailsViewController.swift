//
//  SongDetailsViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit
import SpotifyKit

class SongDetailsViewController: UIViewController {
  
  var viewModel: SongDetailsViewModel?
  
  @IBOutlet weak var trackTitle: UILabel!
  @IBOutlet weak var artist: UILabel!
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var backgroundImage: UIImageView!
  

    override func viewDidLoad() {
      super.viewDidLoad()
      self.title = viewModel?.date()
      trackTitle.text = viewModel?.song.title
      artist.text = viewModel?.song.artist
      let fontName = getFont(year: Int((viewModel?.song.date[0...3])!) ?? 0)
      trackTitle.font = UIFont(name: fontName, size: 26)
      artist.font = UIFont(name: fontName, size: 18)

      self.backgroundImage.image = getImage(year: Int(viewModel!.song.date[0...3]) ?? 0)
    }
  
    @IBAction func openSpotify(_ sender: Any) {
      viewModel!.openSpotify()
    }
  
  @IBAction func shareButtonTapped(_ sender: Any) {
    let title = viewModel!.song.title
    let artist = viewModel!.song.artist
    let year = viewModel!.song.date[0...3]
    let url = viewModel!.song.url
    let textToShare = "Did you know? On this day in \(String(describing: year)), \(String(describing: title)) by \(String(describing: artist)) was the #1 song in America? \(String(describing: url))"
    
    let ac = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
    present(ac, animated: true)
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let link = viewModel?.song.url
    (segue.destination as! ChartWebViewController).urlString = link
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
