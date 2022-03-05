//
//  MusicTableViewCell.swift
//  Axbit test var.3
//
//  Created by 111 on 04.03.2022.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    static let identifier = "MusicTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MusicTableViewCell",
                     bundle: nil)
    }
    public func configure(with title: String, with imageName: String) {
        musicTitleLabel.text = title
        musicImageView.loadFrom(urlAdress: imageName)
    }

    @IBOutlet var musicImageView: UIImageView!
    @IBOutlet var musicTitleLabel: UILabel!
}
