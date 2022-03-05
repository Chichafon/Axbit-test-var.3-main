//
//  MusicListTabViewController.swift
//  Axbit test var.3
//
//  Created by 111 on 27.02.2022.
//

import Foundation
import UIKit

class MusicListTabViewController: UIViewController {

    //MARK: - Properties

    let networkDataFetcher = NetworkDataFeature()
    var musicGenreListModel: DataModel? = nil
    var urlString = ""


    @IBOutlet weak var musicListForPickedArtist: UITableView!

    //MARK: - Lyfe cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        musicListForPickedArtist.delegate = self
        musicListForPickedArtist.dataSource = self
        musicListForPickedArtist.register(MusicTableViewCell.nib(), forCellReuseIdentifier: MusicTableViewCell.identifier)

        urlString = "https://itunes.apple.com/search?term=eminem&media=music&limit=10"

        networkDataFetcher.fetchData(urlString: urlString) { (musicGenreListModel) in
            guard let musicGenreListModel = musicGenreListModel else { return }
            self.musicGenreListModel = musicGenreListModel
            self.musicListForPickedArtist.reloadData()
        }
    }
}

//MARK: - Extensions

extension MusicListTabViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (musicGenreListModel?.resultCount) ?? 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let musicListCell = musicListForPickedArtist.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as! MusicTableViewCell

        let trackName = musicGenreListModel?.results[indexPath.row]
        let trackImage = musicGenreListModel?.results[indexPath.row]
        musicListCell.configure(with: (trackName?.trackName) ?? "nil", with: (trackImage?.artworkUrl100) ?? "gear")

        return musicListCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension UIImageView {
    func loadFrom(urlAdress: String) {
        guard let url = URL(string: urlAdress) else { return }


        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
