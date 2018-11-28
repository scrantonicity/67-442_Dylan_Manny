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
  
  @IBOutlet weak var date: UILabel!
  @IBOutlet weak var cover: UIImageView!
  @IBOutlet weak var trackTitle: UILabel!
  @IBOutlet weak var artist: UILabel!
  @IBOutlet weak var playButton: UIButton!
  

    override func viewDidLoad() {
      super.viewDidLoad()
      date.text = viewModel?.song.date
//      cover.image =
      trackTitle.text = viewModel?.song.title
      artist.text = viewModel?.song.artist
      
//      spotifyManager.authorize()
//
//      spotifyManager.find(SpotifyTrack.self,  (viewModel?.song.title)!) { tracks in
//        for track in tracks {
//          print("URI \(track.uri)")
//        }
//      }
      
//      self.refresh()
    }
  
//  func refresh() -> Void {
//    viewModel!.refresh()
//  }
  
    @IBAction func openSpotify(_ sender: Any) {
      viewModel!.openSpotify()
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
