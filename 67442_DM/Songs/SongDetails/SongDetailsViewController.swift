//
//  SongDetailsViewController.swift
//  67442_DM
//
//  Created by Dylan Hyun on 11/26/18.
//  Copyright © 2018 Dylan Hyun. All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {
  
  var viewModel: SongDetailsViewModel?
  
  @IBOutlet weak var date: UILabel!
  @IBOutlet weak var cover: UIImageView!
  @IBOutlet weak var trackTitle: UILabel!
  @IBOutlet weak var artist: UILabel!
  @IBOutlet weak var url: UILabel!
  

    override func viewDidLoad() {
      super.viewDidLoad()
      date.text = viewModel?.song.date
//      cover.image =
      trackTitle.text = viewModel?.song.title
      artist.text = viewModel?.song.artist
      self.refresh()
    }
  
  func refresh() -> Void {
    viewModel!.refresh() { [unowned self] in
      DispatchQueue.main.async {
        self.url.reloadInputViews()
      }
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
