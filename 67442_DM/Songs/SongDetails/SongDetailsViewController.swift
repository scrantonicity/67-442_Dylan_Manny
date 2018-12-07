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
      print(Int(viewModel!.song.date[0...3]))
      print(fontName)
      self.backgroundImage.image = getImage(year: Int(viewModel!.song.date[0...3]) ?? 0)
    }
  
    @IBAction func openSpotify(_ sender: Any) {
      viewModel!.openSpotify()
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
