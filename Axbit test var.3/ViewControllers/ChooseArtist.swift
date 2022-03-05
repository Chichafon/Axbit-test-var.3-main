//
//  MusicGenreTabViewController.swift
//  Axbit test var.3
//
//  Created by 111 on 27.02.2022.
//

import Foundation
import UIKit

class ChooseArtist: UIViewController {

    //MARK: - Properties

    @IBOutlet weak var chooseArtistName: UILabel!
    @IBOutlet weak var table: UITableView!
    var switchButton: Bool = false
    var data: [String]?

    //MARK: - Lyfe cicle

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(ArtistTableViewCell.nib(), forCellReuseIdentifier: ArtistTableViewCell.identifire)
        table.delegate = self
        table.dataSource = self
        chooseArtistName.text = "Выбери певца"
    }
}

//MARK: - Extensions

extension ChooseArtist: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.identifire, for: indexPath) as! ArtistTableViewCell
        cell.configureButtonState(with: switchButton)
        cell.configureNames(name: data?[indexPath.row] ?? "nil")

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
