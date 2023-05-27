//
//  ViewController.swift
//  HinakkoKadai6
//
//  Created by Hina on 2023/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var resultTitle: UILabel!
    @IBOutlet private weak var slider: UISlider!

    private var randomValue: Int = ViewController.makeRandomValue()

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTitle.text = "\(randomValue)"
    }

    @IBAction private func resultButton(_ sender: UIButton) {
        let sliderValue = Int(slider.value)

        if sliderValue == randomValue {
            presentAlert(message: "あたり！\nあなたの値: \(sliderValue)")
        } else {
            presentAlert(message: "はずれ！\nあなたの値: \(sliderValue)")
        }

    }

    private func presentAlert(message: String?) {
        //現在のインターフェイス コントローラー上にアラートまたはアクション シートを表示
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        //title や message を指定して、UIAlertController を生成

        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.randomValue = ViewController.makeRandomValue()
            self.resultTitle.text = "\(self.randomValue)"}))
        //UIAlertAction で OK ボタンを生成し、addAction() でアラートダイアログにその UIAlertAction を追加


        present(alert, animated: true ,completion: nil)//アラートダイアログを画面に表示

    }

    private static func makeRandomValue() -> Int {
        Int.random(in: 1...100)
    }
}
