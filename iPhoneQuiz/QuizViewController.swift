//
//  QuizViewController.swift
//  iPhoneQuiz
//
//
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray=[Any]()
    
    var correctAnser:Int=0
    
    @IBOutlet var quizTextView:UITextView!
    
    @IBOutlet var choiceButton1:UIButton!
    @IBOutlet var choiceButton2:UIButton!
    @IBOutlet var choiceButton3:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //3つの選択肢と答えの番号が入った配列
        quizArray.append(["Appleの2015年現在のCEOの名前は？","スティーブ・ジョブズ","ティム・クック","ジョナサン・アイブ",2])
        quizArray.append(["iPhone6s,iPhone6s Plusから新たに導入された、画面タッチの指の圧力を検出する機能を何という？","3Dタッチ","4Dタッチ","スーパータッチ",1])
        quizArray.append(["iPod touchのモデルの中で最大容量のものは何GB?","64GB","128GB","160GB",2])
        quizArray.append(["1985年、Appleを追放されたジョブズが立ち上げた会社の正式名称は？","NEXt, Inc.","NExT, Inc.","NeXT, Inc.",3])
        quizArray.append(["2015年9月30日にリリースされたOSXの名前は？","El Captain","El Capitan","ElCapital",2])
        quizArray.append(["Apple WatchとiPhoneとどんな通信方式でペアリングされる？","FM電波","Wi-Fi","Bluetooth",3])
        
        //問題文をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz(){
        //一時的にクイズを取り出しておく配列
        let tmpArray=quizArray[0] as! [Any]
        //問題文を表示
        quizTextView.text=tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1]  as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2]  as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3]  as? String, for: .normal)
    }
    
    //問題が全て終わったら自動で結果画面に行く
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    //セグエを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer=self.correctAnser
        }
    }
    
    @IBAction func choiceAnswer(sender:UIButton){
        let tmpArray=quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            //正解数を増やす
            correctAnser=correctAnser+1
        }
        
        //解いた問題を取り除く
        quizArray.remove(at:0)
        
        //解いた問題の合計があらかじめ設定した問題数に達したら結果画面へ
        if quizArray.count==0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
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
