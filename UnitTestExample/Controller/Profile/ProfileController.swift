//
//  ProfileController.swift
//  UnitTestExample
//
//  Created by ahmad shiddiq on 15/04/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var labelProfile: UILabel!
    @IBOutlet weak var tableProfile: UITableView!
    
    var listProfile = [Profile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataProfile()
        tableProfile.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hiddenLineNavigation()
    }
    
    private func setDataProfile() {
        listProfile.append(Profile(type: "Change Username"))
        listProfile.append(Profile(type: "Change Password"))
        listProfile.append(Profile(type: "Help"))
        listProfile.append(Profile(type: "Logout"))
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? ProfileCell else {
            return .init()
        }
        cell.labelType.text = listProfile[indexPath.row].type
        if listProfile[indexPath.row].type == "Logout" {
            cell.imageType.isHidden = true
        } else {
            cell.imageType.isHidden = false
        }
        return cell
    }
}
