//
//  GroupsViewController.swift
//  snipe
//
//  Created by Aaron Ashby on 2/8/25.
//

import UIKit

class GroupsViewController: UIViewController {
    let groupsView = GroupsView()
    
    override func loadView() {
        view = GroupsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
