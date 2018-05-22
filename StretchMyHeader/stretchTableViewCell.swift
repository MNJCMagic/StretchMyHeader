//
//  stretchTableViewCell.swift
//  StretchMyHeader
//
//  Created by Mike Cameron on 2018-05-22.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

import UIKit

class stretchTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                headlineLabel.text = item.summary
            } else {
                categoryLabel.text = nil
                headlineLabel.text = nil
            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
