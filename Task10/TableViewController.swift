//
//  TableViewController.swift
//  Task10
//
//  Created by ちいつんしん on 2021/07/05.
//

import UIKit

class TableViewController: UITableViewController {
    private let prefectureRepository = PrefectureRepostiroy()

    private var prefectureNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        prefectureRepository.fetch(completion: { [weak self] in
            self?.prefectureNames = $0
            self?.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectureNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = prefectureNames[indexPath.row]

        cell.detailTextLabel?.text = "\(indexPath.row + 1)番目の都道府県です"

        let colors: [UIColor] = [#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
        cell.backgroundColor = colors[indexPath.row % colors.count]

        return cell
    }
}
