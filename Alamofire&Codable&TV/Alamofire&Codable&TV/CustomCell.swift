//
//  CustomCell.swift
//  Alamofire&Codable&TV
//
//  Created by Srans022019 on 06/05/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
