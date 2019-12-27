//
//  BountyViewController.swift
//  BountyListAgain
//
//  Created by APPLE on 2019/12/27.
//  Copyright © 2019 JeongminKim. All rights reserved.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 들어갈 이미지명을 순차대로 적어준다
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    // 들어갈 상금의 숫자를 순차대로 적어준다
    let bountyList = [330000, 50, 440000, 300000, 160000, 80000, 77000, 120000]

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // segue를 통해 DetailView로 자료를 넘겨주기 위해서는 prepare를 오버라이딩 해야된다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 지정 identifier로 해당 뷰를 지정하여 자료를 넘긴다
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController // 목적지는 DetailViewController다
            // Integer정보가 내려오므로 as?로 다운캐스팅 해서 받는다
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    
    // 몇 개를 보여줄 것인가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count // 이제 보여지는 개수는 nameList 배열 내부에 들어가 있는 자료의 개수만큼이다
    }
    
    // 셀은 어떻게 표현할 것인가
    // 'ListCell'을 사용하겠다
    // Storyboard의 Attributes inspector에서 Identifier를 설정해준다
    // Identifier를 이용해서 셀을 가져오게 되고, 그 셀을 리사이클 할 수 있다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스터마이징한 셀을 활용하기 위해서는 dequeueReusableCell 메소드를 호출한다
        // 재사용가능한 셀을 사용할 때 아이덴티파이어를 사용하고(withIdentifier: "cell"), 보여지는 셀이 몇 번째냐는 것에는 메소드에 파라미터로 들어온 녀석(indexPath)를 그대로 사용해준다
        // 그냥 cell의 경우 ListCell에서 커스터마이징한 내용을 사용할 수 없기 때문에 다운캐스팅을 해줘야 한다(as? LiscCell)
        // as에 ?가 들어가는 것은 다운캐스팅이 실패할 수도 있기 때문 -> guard let 구문을 사용해준다
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        // img, name, bounty
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg") // nameList에 있는 이미지명 뒤에 확장자 .jpg를 붙여준다
        cell.imgView.image = img // 위에서 만들어진 이미지를 커스터마이징된 셀의 이미지뷰에 넣어준다
        cell.nameLabel.text = nameList[indexPath.row] // nameLabel에는 nameList에 있는 이름들을 넣어준다
        cell.bountyLabel.text = String(bountyList[indexPath.row]) // bountyLabel에는 bountyList에 있는 숫자들을 넣어준다
        // bountyList가 Int 타입이므로 타입 변환을 해주기 위해 String으로 감싸준다
        
        return cell
    }
    
    // 셀이 클릭되었을 때 어쩔거야?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        // 버튼을 눌렀을 때 segue를 이용하여 화면을 이동할 수 있게 한다
        // 이 때 미리 지정해뒀던 Identifier인 'showDetail'을 사용
        // sender에 indexPath.row를 넣어줌으로써 클릭된 셀의 자료를 segue를 통해 넘긴다
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    


}

// 커스터마이징 셀을 만들기 위해서는 기존의 셀을 상속받아 새로운 셀을 만들어야 한다
// 스토리보드의 커스텀 클래스에서 클래스 항목을 'ListCell'로 변경한다
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
}
