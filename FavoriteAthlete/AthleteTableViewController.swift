import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    
    @IBSegueAction func editSegue(_ coder: NSCoder, sender: Any?) -> EditDetailsViewController? {
        let favoriteAthlete: Athlete?
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            favoriteAthlete = athletes[indexPath.row]
        } else {
            favoriteAthlete = nil
        }
        return EditDetailsViewController(coder: coder, favAthlete: favoriteAthlete)
    }
    @IBSegueAction func addAthlete(_ coder: NSCoder, sender: Any?) -> EditDetailsViewController? {
        return EditDetailsViewController(coder: coder, favAthlete: nil)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    @IBAction func unwindToAthleteTableViewController( _ segue: UIStoryboardSegue) {
        guard let editDetailViewController = segue.source as? EditDetailsViewController, let favAthlete = editDetailViewController.favoriteAthlete else { return }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = favAthlete
        } else {
            athletes.append(favAthlete)
        }
    }
    
}
