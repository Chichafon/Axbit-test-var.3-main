//
//  tableViewCell.swift
//  Axbit test var.3
//
//  Created by 111 on 02.03.2022.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    //MARK: - Properties
    static let identifire = "ArtistTableViewCell"

    @IBOutlet weak var artistCellLabel: UILabel!
    @IBOutlet weak var artistCellSwitchButton: UISwitch!

    //MARK: - Actions

    @IBAction func artistCellButton(_ sender: UISwitch) {
        if sender.isOn {
            MusicListTabViewController().urlString = "https://itunes.apple.com/search?term=\(artistCellLabel.text ?? "2pac")&media=music&limit=10"
            print(MusicListTabViewController().urlString)
        } else {
            MusicListTabViewController().urlString = "https://itunes.apple.com/search?&media=music&limit=10"
            print(MusicListTabViewController().urlString)
        }
    }

    //MARK: - Static funcs

    static func nib() -> UINib {
        return UINib(nibName: "ArtistTableViewCell", bundle: nil)
    }

    func configureNames(name: String) {
        artistCellLabel.text = name
    }

    func configureButtonState(with isOn: Bool) {
        artistCellSwitchButton.isOn = false
    }
}
