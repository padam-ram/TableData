//
//  TadaTableViewCell.swift
//  Test
//
//  Created by Prudhvi Raju Battini on 07/05/24.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var SerialNo: UILabel!
    @IBOutlet weak var SerialNoId: UILabel!
    
    @IBOutlet weak var idTitle: UILabel!
    @IBOutlet weak var IdnoInfo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindDataToLabel(data:TableData){
        
        SerialNoId.text = data.id ?? ""
        IdnoInfo.text = data.parentId ?? ""
        
    }

}
