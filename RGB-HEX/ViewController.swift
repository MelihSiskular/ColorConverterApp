//
//  ViewController.swift
//  RGB-HEX
//
//  Created by Melih Şişkular on 2.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmenetedControlOutlet: UISegmentedControl!
    
    var width = CGFloat()
    var height = CGFloat()
    
    var redSlider = UISlider()
    var greenSlider = UISlider()
    var blueSlider = UISlider()
    
    var labelmin1 = UILabel()
    var labelmin2 = UILabel()
    var labelmin3 = UILabel()
    var labelmax1 = UILabel()
    var labelmax2 = UILabel()
    var labelmax3 = UILabel()
    
    var redValueLabel = UILabel()
    var greenValueLabel = UILabel()
    var blueValueLabel = UILabel()
    
    var colorView = UIImageView()
    var colorViewSecond = UIImageView()
    
    var hexResult = UILabel()
    
    var rgbRed = 0
    var rgbGreen = 0
    var rgbBlue = 0

    
    var hexRed = UITextField()
    var hexGreen = UITextField()
    var hexBlue = UITextField()
    
    var rgbResult = UILabel()
    
    var exchangeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = view.frame.size.width
        height = view.frame.size.height
       
        let myFont = UIFont.systemFont(ofSize: 17) //Segemented Control için!
 
        segmenetedControlOutlet.layer.cornerRadius = 20
        segmenetedControlOutlet.setTitleTextAttributes([NSAttributedString.Key.font : myFont], for: UIControl.State.selected)
        segmenetedControlOutlet.setTitle("RGB -> HEX", forSegmentAt: 0)
        segmenetedControlOutlet.setTitle("HEX -> RGB", forSegmentAt: 1)
        segmenetedControlOutlet.frame = CGRect(x: width * 0.5 - (width * 0.6)/2, y: height * 0.07, width: width * 0.6, height: height * 0.08)
        view.addSubview(segmenetedControlOutlet)
        
        
       
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255
        redSlider.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.19, width: width * 0.7, height: height * 0.05)
        redSlider.thumbTintColor = .red
        redSlider.tintColor = .red
        redSlider.addTarget(self, action: #selector(redSliderValueChange), for: UIControl.Event.valueChanged)
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.27, width: width * 0.7, height: height * 0.05)
        greenSlider.thumbTintColor = .green
        greenSlider.tintColor = .green
        greenSlider.addTarget(self, action: #selector(greenSliderValueChange), for: UIControl.Event.valueChanged)
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.35, width: width * 0.7, height: height * 0.05)
        blueSlider.thumbTintColor = .blue
        blueSlider.tintColor = .blue
        blueSlider.addTarget(self, action: #selector(blueSliderValueChange), for: UIControl.Event.valueChanged)
        
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        
        labelmax1.frame = CGRect(x: width * 0.87, y: height * 0.175, width: width * 0.1, height: height * 0.08)
        labelmax1.text = "255"
        labelmax1.textColor = .red
        labelmax1.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmax1)
        
        labelmax2.frame = CGRect(x: width * 0.87, y: height * 0.255, width: width * 0.1, height: height * 0.08)
        labelmax2.text = "255"
        labelmax2.textColor = .green
        labelmax2.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmax2)
        
        labelmax3.frame = CGRect(x: width * 0.87, y: height * 0.335, width: width * 0.1, height: height * 0.08)
        labelmax3.text = "255"
        labelmax3.textColor = .blue
        labelmax3.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmax3)
        
        labelmin1.frame = CGRect(x: width * 0.11, y: height * 0.175, width: width * 0.1, height: height * 0.08)
        labelmin1.text = "0"
        labelmin1.textColor = .red
        labelmin1.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmin1)
        
        labelmin2.frame = CGRect(x: width * 0.11, y: height * 0.255, width: width * 0.1, height: height * 0.08)
        labelmin2.text = "0"
        labelmin2.textColor = .green
        labelmin2.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmin2)
        
        labelmin3.frame = CGRect(x: width * 0.11, y: height * 0.335, width: width * 0.1, height: height * 0.08)
        labelmin3.text = "0"
        labelmin3.textColor = .blue
        labelmin3.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(labelmin3)
        
                
        redValueLabel.frame = CGRect(x: (width * 0.5 - (width * 0.25)/2) - width * 0.35, y: height * 0.4, width: width * 0.25, height: height * 0.1)
        redValueLabel.text = "Kırmızı: \(Int(redSlider.value).description)"
        redValueLabel.textAlignment = .center
        view.addSubview(redValueLabel)
        
        greenValueLabel.frame = CGRect(x: width * 0.5 - (width * 0.25)/2, y: height * 0.4, width: width * 0.25, height: height * 0.1)
        greenValueLabel.text = "Yeşil: \(Int(greenSlider.value).description)"
        greenValueLabel.textAlignment = .center
        view.addSubview(greenValueLabel)
        
        blueValueLabel.frame = CGRect(x: (width * 0.5 - (width * 0.25)/2) + width * 0.35, y: height * 0.4, width: width * 0.25, height: height * 0.1)
        blueValueLabel.text = "Mavi: \(Int(blueSlider.value).description)"
        blueValueLabel.textAlignment = .center
        view.addSubview(blueValueLabel)
        
        colorView.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.5, width: width * 0.8, height: height * 0.2)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        colorView.layer.cornerRadius = 8
        view.addSubview(colorView)
        
        colorViewSecond.frame = CGRect(x: width * 0.5 - (width * 0.8)/2, y: height * 0.5, width: width * 0.8, height: height * 0.2)
        colorViewSecond.backgroundColor = UIColor(red: CGFloat(rgbRed/255), green: CGFloat(rgbGreen/255), blue: CGFloat(rgbBlue/255), alpha: 1)
        colorViewSecond.layer.cornerRadius = 8
        view.addSubview(colorViewSecond)
        colorViewSecond.isHidden = true
        
        hexResult.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.75, width: width * 0.7, height: height * 0.1)
        hexResult.font = UIFont(name: "Kefa", size: 20)
        hexResult.text = "HEX Sonucu : #000000"
        hexResult.textAlignment = .center
        view.addSubview(hexResult)
        
        hexRed.borderStyle = .roundedRect
        hexBlue.borderStyle = .roundedRect
        hexGreen.borderStyle = .roundedRect
        
        exchangeButton.setTitle("DÖNÜŞTÜR", for: UIControl.State.normal)
        exchangeButton.frame = CGRect(x: width * 0.5 - (width * 0.5)/2, y: height * 0.42, width: width * 0.5, height: height * 0.06)
        exchangeButton.layer.cornerRadius = 8
        exchangeButton.setTitleColor(.white, for: UIControl.State.normal)
        exchangeButton.backgroundColor = UIColor(red: 0.9271809459, green: 0, blue: 0.627174437, alpha: 1)
        exchangeButton.addTarget(self, action: #selector(calculateRgbResult), for: UIControl.Event.touchUpInside)
        
        hexRed.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.19, width: width * 0.7, height: height * 0.05)
        hexRed.placeholder = "Kırmızı HEX Değeri"
        hexGreen.placeholder = "Yeşil HEX Değeri"
        hexBlue.placeholder = "Mavi HEX Değeri"
        hexGreen.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.27, width: width * 0.7, height: height * 0.05)
        hexBlue.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.35, width: width * 0.7, height: height * 0.05)
        rgbResult.frame = CGRect(x: width * 0.5 - (width * 0.7)/2, y: height * 0.75, width: width * 0.7, height: height * 0.19)
        rgbResult.font = UIFont(name: "Kefa", size: 20)
        rgbResult.textAlignment = .center
        rgbResult.text = "RGB SONUCU \n \nKırmızı: 00\nYeşil: 00\nMavi: 00"
        rgbResult.numberOfLines = 5
        
        hexRed.isHidden = true
        hexGreen.isHidden = true
        hexBlue.isHidden = true
        rgbResult.isHidden = true
        exchangeButton.isHidden = true
        view.addSubview(hexRed)
        view.addSubview(hexGreen)
        view.addSubview(hexBlue)
        view.addSubview(rgbResult)
        view.addSubview(exchangeButton)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        view.addGestureRecognizer(gesture)
        
        
    }
    
    @IBAction func segmentedControlFunc(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            //İlk Ekranın
            redSlider.isHidden = false
            greenSlider.isHidden = false
            blueSlider.isHidden = false
            hexResult.isHidden = false
            redValueLabel.isHidden = false
            greenValueLabel.isHidden = false
            blueValueLabel.isHidden = false
            labelmin1.text = "0"
            labelmin2.text = "0"
            labelmin3.text = "0"
            labelmax1.text = "255"
            labelmax2.text = "255"
            labelmax3.text = "255"
            colorView.isHidden = false
        
            
            //İkinci Ekranın
            hexRed.isHidden = true
            hexGreen.isHidden = true
            hexBlue.isHidden = true
            rgbResult.isHidden = true
            exchangeButton.isHidden = true
            labelmin1.frame = CGRect(x: width * 0.11, y: height * 0.175, width: width * 0.1, height: height * 0.08)
            labelmin2.frame = CGRect(x: width * 0.11, y: height * 0.255, width: width * 0.1, height: height * 0.08)
            labelmin3.frame = CGRect(x: width * 0.11, y: height * 0.335, width: width * 0.1, height: height * 0.08)
            colorViewSecond.isHidden = true
            
        }else if sender.selectedSegmentIndex == 1 {
          
            //İlk Ekranın
            redSlider.isHidden = true
            greenSlider.isHidden = true
            blueSlider.isHidden = true
            hexResult.isHidden = true
            redValueLabel.isHidden = true
            greenValueLabel.isHidden = true
            blueValueLabel.isHidden = true
            colorView.isHidden = true
           
            
            //İkinci Ekranın
            hexRed.isHidden = false
            hexGreen.isHidden = false
            hexBlue.isHidden = false
            rgbResult.isHidden = false
            exchangeButton.isHidden = false
            labelmin1.text = "00"
            labelmin2.text = "00"
            labelmin3.text = "00"
            labelmax1.text = "FF"
            labelmax2.text = "FF"
            labelmax3.text = "FF"
            labelmin1.frame = CGRect(x: width * 0.08, y: height * 0.175, width: width * 0.1, height: height * 0.08)
            labelmin2.frame = CGRect(x: width * 0.08, y: height * 0.255, width: width * 0.1, height: height * 0.08)
            labelmin3.frame = CGRect(x: width * 0.08, y: height * 0.335, width: width * 0.1, height: height * 0.08)
            colorViewSecond.isHidden = false
        }
        
        
    }
    
    
    @objc
    func redSliderValueChange(sender: UISlider) {
        redValueLabel.text = "Kırmızı: \(Int(redSlider.value).description)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        calculateHexResult(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    @objc
    func greenSliderValueChange(sender: UISlider) {
        greenValueLabel.text = "Yeşil: \(Int(greenSlider.value).description)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        calculateHexResult(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    
    @objc
    func blueSliderValueChange(sender: UISlider) {
        blueValueLabel.text = "Mavi: \(Int(blueSlider.value).description)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: 1)
        calculateHexResult(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    }
    @objc
    func calculateRgbResult() {
        
       
        
     
        
        var rgbRedLeft = 0
        var rgbRedRight = 0
        var rgbGreenLeft = 0
        var rgbGreenRight = 0
        var rgbBlueLeft = 0
        var rgbBlueRight = 0
        
        let hexDictioanry = ["1":1,
                             "2":2,
                             "3":3,
                             "4":4,
                             "5":5,
                             "6":6,
                             "7":7,
                             "8":8,
                             "9":9,
                             "A":10,
                             "B":11,
                             "C":12,
                             "D":13,
                             "E":14,
                             "F":15,
                             "0":0,
                             "a":10,
                             "b":11,
                             "c":12,
                             "d":13,
                             "e":14,
                             "f":15]
        
        //Red
        if hexRed.text?.count == 2 {
            for i in hexRed.text! {
                if hexDictioanry[String(i)] != nil {
                    
                    var a = 0
                    for i in hexRed.text! {
                        if a == 0 {
                            rgbRedLeft = hexDictioanry[String(i)]!
                            a += 1
                        }else {
                            rgbRedRight = hexDictioanry[String(i)]!
                           
                        }
                        
                        rgbRed = ((rgbRedLeft*16)+rgbRedRight)
                        
                        //Green
                        if hexGreen.text?.count == 2 {
                            for i in hexGreen.text! {
                                if hexDictioanry[String(i)] != nil {
                                    
                                    var a = 0
                                    for i in hexGreen.text! {
                                        if a == 0 {
                                            rgbGreenLeft = hexDictioanry[String(i)]!
                                            a += 1
                                        }else {
                                            rgbGreenRight = hexDictioanry[String(i)]!
                                           
                                        }
                                        
                                        rgbGreen = ((rgbGreenLeft*16)+rgbGreenRight)
                                        
                                        
                                        //Blue
                                        if hexBlue.text?.count == 2 {
                                            for i in hexBlue.text! {
                                                if hexDictioanry[String(i)] != nil {
                                                    
                                                    var a = 0
                                                    for i in hexBlue.text! {
                                                        if a == 0 {
                                                            rgbBlueLeft = hexDictioanry[String(i)]!
                                                            a += 1
                                                        }else {
                                                            rgbBlueRight = hexDictioanry[String(i)]!
                                                           
                                                        }
                                                        
                                                        rgbBlue = ((rgbBlueLeft*16)+rgbBlueRight)
                                                        
                                                        
                                                        rgbResult.text = "RGB SONUCU \n \n"
                                                        rgbResult.text! += "Kırmızı: \(rgbRed)\n"
                                                        rgbResult.text! += "Yeşil: \(rgbGreen)\n"
                                                        rgbResult.text! += "Mavi: \(rgbBlue)"
                                                        print(Float(rgbRed)/255)
                                                        print(Float(rgbGreen)/255)
                                                        print(Float(rgbBlue)/255)
                                                        
                                                        colorViewSecond.backgroundColor = UIColor(red: CGFloat(Float(rgbRed)/255), green: CGFloat(Float(rgbGreen)/255), blue: CGFloat(Float(rgbBlue)/255), alpha: 1)
                                                        
                                                    }
                                                   
                                                }else {
                                                    makeAlert(message: "Öyle Bir Değer yok")
                                                }
                                            }
                                        }else {
                                            makeAlert(message: "Girilen Değer 2 Karakterli Olmalı")
                                        }
                                        
                                    }
                                   
                                }else {
                                    makeAlert(message: "Öyle Bir Değer yok")
                                }
                            }
                        }else {
                            makeAlert(message: "Girilen Değer 2 Karakterli Olmalı")
                        }
                        
                    }
                   
                }else {
                    makeAlert(message: "Öyle Bir Değer yok")
                }
            }
            
        }else {
            makeAlert(message: "Girilen Değer 2 Karakterli Olmalı")
        }
        
      
  
        
        
      
     
       
    }
    
    
    func calculateHexResult(red: Float,green:Float,blue:Float) {
        
        let hexDictioanry = [1:"1",
                             2:"2",
                             3:"3",
                             4:"4",
                             5:"5",
                             6:"6",
                             7:"7",
                             8:"8",
                             9:"9",
                             10:"A",
                             11:"B",
                             12:"C",
                             13:"D",
                             14:"E",
                             15:"F",
                             0:"0"]
        
        
        var redInt = Int(red)
        var greenInt = Int(green)
        var blueInt = Int(blue)
        
        //Red
        var remainRed = redInt % 16
        var leftSideRed = (redInt - remainRed) / 16
       
        //Green
        var remainGreen = greenInt % 16
        var leftSideGreen = (greenInt - remainGreen) / 16
        
        //Blue
        
        var remainBlue = blueInt % 16
        var leftSideBlue = (blueInt - remainBlue) / 16
        
        hexResult.text = "Hex Sonucu : #"
        if let leftRed = hexDictioanry[leftSideRed] as? String {
            if let rightRed = hexDictioanry[remainRed] as? String{
                hexResult.text! += "\(leftRed)\(rightRed)"
                
                if let leftGreen = hexDictioanry[leftSideGreen] as? String {
                    if let rightGreen = hexDictioanry[remainGreen] as? String{
                        hexResult.text! += "\(leftGreen)\(rightGreen)"
                        
                        
                        if let leftBlue = hexDictioanry[leftSideBlue] as? String {
                            if let rightBlue = hexDictioanry[remainBlue] as? String{
                                hexResult.text! += "\(leftBlue)\(rightBlue)"
                                
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    @objc
    func tapGesture() {
        view.endEditing(true)
    }
    
    func makeAlert(message:String) {
        
        let alert = UIAlertController(title: "HATA", message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }

}

