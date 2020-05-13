//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["新撰組の初代筆頭は誰でしょうか？", "1.土方歳三", "2.近藤勇", "3.芹沢鴨", 3])
        quizArray.append(["幕末幕政に参加した四賢候でないのは？", "1.山内容堂", "2.伊達宗城", "3.徳川慶喜", 3])
        quizArray.append(["坂本龍馬が中岡慎太郎と共に暗殺された京都の宿谷をなんというでしょうか？", "1.近江屋", "2.池田屋", "3.寺田屋", 1])
        quizArray.append(["偽名として才谷梅太郎と名乗っていたのは誰でしょう？", "1.勝海舟", "2.坂本龍馬", "3.高杉晋作", 2])
        quizArray.append(["黒船来航の際ペリーらは神奈川県横須賀市浦和に来航しました。浦賀に来る前に日本のある場所によっていますがどこでしょうか？", "1.沖縄（琉球）", "2.愛知県", "3.大阪府", 1])
        quizArray.append(["新撰組の中でも会津の京都守護職だったのは誰でしょう？", "1.松平元康", "2.松平容保", "3.松平義盛", 2])
        quizArray.append(["坂本龍馬を代表とする亀山社中の初仕事は長崎のグラバー商会からあるものを買い付けました。それは何でしょう？", "1.宝石", "2.西洋食器", "3.銃", 3])
        quizArray.append(["江戸にきた坂本龍馬は海外事情に詳しい河田小龍の通商航海論に共鳴します、この人物の職業は何でしょう？", "1.医者", "2.絵師", "3.商人", 2])

        //------------------------ここから上にクイズを書く------------------------//

        //quizArrayの中身をシャッフルする
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


