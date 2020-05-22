//
//  ViewController.swift
//  Alamofire&Codable&TV
//
//  Created by Srans022019 on 06/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var x : Employers?
    
    var employeeNameArray = [String]()
    var employeeIDArray = [String]()
    var employeeAgeArray = [String]()
    var employeeSalaryArray = [String]()
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        table.tableFooterView = UIView()
        
        serverData()
        
        // Do any additional setup after loading the view.
    }
    
    
    func serverData() {
        
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
        
        AF.request(url!).validate().responseJSON { (response) in
            
            let convertedData = response.data
            
            guard let data = convertedData else{return}
            
            do{
                
                self.x = try JSONDecoder().decode(Employers.self, from: data)
                
                print(self.x!.status)
                print(self.x!.data.count)
                
//                for details in self.x!.data {
//
//                    self.employeeNameArray.append(details.employeeName)
//
//                    self.employeeIDArray.append(details.id)
//                    self.employeeAgeArray.append(details.employeeAge)
//                    self.employeeSalaryArray.append(details.employeeSalary)
//
//                }
                
                self.table.reloadData()
                
            }catch{
                print(error)
            }
            
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let value = self.x?.data.count else { return 1 }
        
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.x?.data[indexPath.row].employeeName
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let next = storyboard?.instantiateViewController(withIdentifier: "EmployeDetailsVC") as! EmployeDetailsVC
        
        let currentCell = table.cellForRow(at: indexPath)
        
        let contentInfo = currentCell?.textLabel?.text! ?? ""
        
        if contentInfo == self.x?.data[indexPath.row].employeeName {
            
            
            
            next.id = self.x?.data[indexPath.row].id
            next.age = self.x?.data[indexPath.row].employeeAge
            next.salary = self.x?.data[indexPath.row].employeeSalary
            
            // next.id = employeeIDArray[indexPath.row]
            //            next.age = employeeAgeArray[indexPath.row]
            //            next.salary = employeeSalaryArray[indexPath.row]
            
            present(next, animated: true, completion: nil)
        }else{
            
            print("Not same values in selected row at index path")
        }
        
    }
    
    //It allows the selected cell to be editable or not
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //editing style of cell when you swipe the cell for delete or inserting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            self.x?.data.remove(at: indexPath.row)
            
            table.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        table.reloadData()
        
    }
    
    //Displaying cell with some fade animation when you are moving up and down the tableview
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Animation steps for cell.
        let rotationCell = CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        
        cell.layer.transform = rotationCell
        cell.alpha = 0
        
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
    
}
