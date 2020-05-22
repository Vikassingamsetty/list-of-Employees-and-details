//
//  EmployeDetailsVC.swift
//  Alamofire&Codable&TV
//
//  Created by Srans022019 on 06/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class EmployeDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!

    
    var id:String?
    var age:String?
    var salary:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        table.tableFooterView = UIView()
        
        table.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        print(id!, "id numbers")
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.idLbl.text = "ID :" + id!
        cell.salaryLbl.text = "Salary:" + salary!
        cell.ageLbl.text = "Age :" + age!
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotation = CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        cell.layer.transform = rotation
        cell.alpha = 0
        
        UIView.animate(withDuration: 1) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
        
    }
    
}
