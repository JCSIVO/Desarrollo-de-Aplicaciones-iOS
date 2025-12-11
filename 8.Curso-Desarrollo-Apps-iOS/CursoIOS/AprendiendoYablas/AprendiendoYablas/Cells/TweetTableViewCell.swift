//
//  TweetTableViewCell.swift
//  AprendiendoYablas
//
//  Created by José Conejero Sivó on 23/11/25.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    // MARK: Referencias UI
    
    @IBOutlet weak var userImageView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.clipsToBounds = true
        
        // frame.width = ancho
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }

   /* override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
 //private
     func setUpCell(username: String, message: String) {
        userNameLabel.text = username
        messageLabel.text = message
    }
    
}
