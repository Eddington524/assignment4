//
//  ViewController.swift
//  assignmet4
//
//  Created by Sammy Jung on 2024/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label7: UILabel!
    @IBOutlet var label6: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label8: UILabel!
    @IBOutlet var label9: UILabel!
    
    @IBOutlet var oneImageView: UIImageView!
    
    @IBOutlet var twoImageView: UIImageView!
    
    @IBOutlet var threeImageView: UIImageView!
    
    @IBOutlet var fourImageView: UIImageView!
    
    @IBOutlet var fiveImageView: UIImageView!
    
    @IBOutlet var sixImageView: UIImageView!
    
    @IBOutlet var sevenImageView: UIImageView!
    
    @IBOutlet var eightImageView: UIImageView!
    
    @IBOutlet var nineImageView: UIImageView!
    
    var count = Array(repeating: 0, count: 10)
//    [Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20),Int.random(in: 0...20)]
    
    var emotionsWords: [String] = ["행복해", "사랑해","좋아요","당황해","속상해", "우울해", "심심해", "찝찝해", "서운해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelList:[UILabel] = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
        
        for i in 0...8 {
            let showtext = UserDefaults.standard.integer(forKey: emotionsWords[i])
            
            labelList[i].text = "\(emotionsWords[i]) \(showtext)"
        }

    
        
// 처음에 저장된 count를 보여주기
        label1.text = "\(emotionsWords[0]) \(UserDefaults.standard.integer(forKey: "행복해"))"
        
//        let labelList:[UILabel] = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
//        
//        changeLabel(labelList,words:emotionsWords)
//        
        let imageViewList:[UIImageView] = [oneImageView,twoImageView,
             threeImageView,fourImageView,fiveImageView,sixImageView,sevenImageView,eightImageView,nineImageView,
        ]
        
        changeTag(imageViewList)
    }

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {

        let number = UserDefaults.standard.integer(forKey: "행복해")
        let newNumber = number + 1
        
        if let imageView = sender.view as? UIImageView{
            
            let labelList:[UILabel] = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
            
            let tagNumber = imageView.tag
            
            // todo 탭한 image의 라벨만 저장된 값을 가져와서 +
            count[tagNumber] = UserDefaults.standard.integer(forKey: emotionsWords[tagNumber]) + 1
            
            // set 하기
            UserDefaults.standard.set(count[tagNumber],forKey:emotionsWords[tagNumber])
            
            // 보여주기
            let resultNum = UserDefaults.standard.integer(forKey: emotionsWords[tagNumber])

            labelList[tagNumber].text = "\(emotionsWords[tagNumber]) \(resultNum)"
          
        }
        else{
            
            print("잘못되었습니다")
        }
        
//        if let imageView = sender.view as? UIImageView{
//            
//            count[imageView.tag]  = count[imageView.tag] + 1
//            
//            let labelList:[UILabel] = [label1,label2,label3,label4,label5,label6,label7,label8,label9]
//            
//            labelList[imageView.tag].text = "\(emotionsWords[imageView.tag])\(count[imageView.tag])"
//        }
//        else{
//            print("잘못되었습니다")
//        }
       
    }
    
    func changeLabel(_ uilist:[UILabel],words:[String] ) {
        for (index,_) in uilist.enumerated(){
            uilist[index].text = "\(words[index])\(count[index])"
            
        }
    }
    
    func changeTag(_ list: [UIImageView]){
        for i in 0...8 {
            list[i].tag = i
            list[i].isUserInteractionEnabled = true
        }
    }
    
//    func plusLabel(_ clickedlabel:UILabel){
//         label1.text = "\(emotionsWords[0])\(label1.tag+1)"
//         label1.tag = label1.tag+1
//    }
}

