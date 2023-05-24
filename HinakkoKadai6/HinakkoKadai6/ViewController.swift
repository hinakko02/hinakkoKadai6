//
//  ViewController.swift
//  HinakkoKadai6
//
//  Created by Hina on 2023/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var resultTitle: UILabel!

    var sliderValue :Int = 0
    let randomNumber :String = ""
    var iValue : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        iValue = 14
        resultTitle.text = "\(iValue)"
    }


    @IBAction private func valueSlider(_ sender: UISlider) {
         sliderValue = Int(sender.value)
    }


    @IBAction private func resultButton(_ sender: UIButton) {

        if sliderValue == iValue {
            presentAlert(message: "あたり！\nあなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "はずれ！\nあなたの値: \(sliderValue)")
        }

        }

        func presentAlert(message: String?) {
            //現在のインターフェイス コントローラー上にアラートまたはアクション シートを表示
            let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
            //title や message を指定して、UIAlertController を生成

            alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: {_ in
                self.iValue = Int.random(in: 1...100)
                self.resultTitle.text = "\(self.iValue)"}))
            //UIAlertAction で OK ボタンを生成し、addAction() でアラートダイアログにその UIAlertAction を追加


            present(alert, animated: true ,completion: nil)//アラートダイアログを画面に表示

        }

    }

