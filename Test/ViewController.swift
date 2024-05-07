//
//  ViewController.swift
//  Test
//
//  Created by Prudhvi Raju Battini on 07/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var dataTableView: UITableView!
    var TableViewData =  [TableData]()
    var filterdArray =  [TableData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        TableViewData.append(TableData(id: "MR0001", isChild: false, parentId: nil))
        TableViewData.append(TableData(id: "MR0002", isChild: true, parentId: "MR0001"))
        TableViewData.append(TableData(id: "MR0003", isChild: false, parentId: nil))
        TableViewData.append(TableData(id: "MR0004", isChild: true, parentId: "MR0003"))
        TableViewData.append(TableData(id: "MR0005", isChild: true, parentId: "MR0003"))
        TableViewData.append(TableData(id: "MR0006", isChild: false, parentId: nil))
        TableViewData.append(TableData(id: "MR0007", isChild: true, parentId: "MR0006"))
        TableViewData.append(TableData(id: "MR0008", isChild: false, parentId: nil))
        TableViewData.append(TableData(id: "MR0009", isChild: false, parentId: nil))
        TableViewData.append(TableData(id: "MR00010", isChild: true, parentId: "MR0009"))
        
        dataTableView.delegate = self
        dataTableView.dataSource = self
        
        for val in TableViewData {
            if val.isChild == true {
                filterdArray.append(val)
            }
        }
        
        filterdArray.sort {
            $0.id! < $1.id!
        }
        
        print("New Array =",filterdArray)
        
        dataTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
        var serialNo : Int = indexPath.row + 1
        cell.SerialNo.text = "Serial No: " + String(serialNo)
        cell.bindDataToLabel(data: filterdArray[indexPath.row])
                 
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

