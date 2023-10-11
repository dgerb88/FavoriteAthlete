//
//  EditDetailsViewController.swift
//  FavoriteAthlete
//
//  Created by Dax Gerber on 10/11/23.
//

import UIKit

class EditDetailsViewController: UIViewController {
    
    var favoriteAthlete: Athlete?
    
    init?(coder: NSCoder, favAthlete: Athlete?) {
        favoriteAthlete = favAthlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favoriteAthlete {
            teamTextField.text = favoriteAthlete.team
            leagueTextField.text = favoriteAthlete.league
            ageTextField.text = favoriteAthlete.age
            nameTextField.text = favoriteAthlete.name
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: Any) {
        let favAthlete = Athlete(name: nameTextField.text!, age: ageTextField.text!, league: leagueTextField.text!, team: teamTextField.text!)
        self.favoriteAthlete = favAthlete
        performSegue(withIdentifier: "unwind", sender: self)
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
