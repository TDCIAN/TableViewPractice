//
//  DetailViewController.swift
//  BountyListAgain
//
//  Created by APPLE on 2019/12/27.
//  Copyright © 2019 JeongminKim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name:String?
    var bounty:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        // 안전하게 자료를 가져오기 위해 if let 구문을 사용한다
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = String(bounty)
        }
    }
    

    @IBAction func close(_ sender: UIButton) {
        // 클로즈 버튼을 눌렀을 때 화면을 꺼 주는 dismiss
        // 특별한 행동이 수반되지 않기 때문에 completion에는 nil이 들어간다
        dismiss(animated: true, completion: nil)
    }


}
