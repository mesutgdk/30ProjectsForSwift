//
//  ViewController.swift
//  Change Font Ya
//
//  Created by Mesut Gedik on 2.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appLabel: UILabel!
    
    var fontNames : [String] = ["Academy Engraved LET", "Al Nile", "American Typewriter", "Apple Color Emoji", "Apple SD Gothic Neo", "Apple Symbols", "Arial", "Arial Hebrew", "Arial Rounded MT Bold", "Avenir", "Avenir Next", "Avenir Next Condensed", "Baskerville", "Bodoni 72", "Bodoni 72 Oldstyle", "Bodoni 72 Smallcaps", "Bodoni Ornaments", "Bradley Hand", "Chalkboard SE", "Chalkduster", "Charter", "Cochin", "Copperplate", "Courier", "Courier New", "Damascus", "Devanagari Sangam MN", "Didot", "DIN Alternate", "DIN Condensed", "Euphemia UCAS", "Farah", "Futura", "Galvji", "Geeza Pro", "Georgia", "Gill Sans", "Grantha Sangam MN", "Helvetica", "Helvetica Neue", "Hiragino Maru Gothic ProN", "Hiragino Mincho ProN", "Hiragino Sans", "Hoefler Text", "Kailasa", "Kefa", "Khmer Sangam MN", "Kohinoor Bangla", "Kohinoor Devanagari", "Kohinoor Gujarati", "Kohinoor Telugu", "Lao Sangam MN", "Malayalam Sangam MN", "Marker Felt", "Menlo", "Mishafi", "Mukta Mahee", "Myanmar Sangam MN", "Noteworthy", "Noto Nastaliq Urdu", "Noto Sans Kannada", "Noto Sans Myanmar", "Noto Sans Oriya", "Optima", "Palatino", "Papyrus", "Party LET", "PingFang HK", "PingFang SC", "PingFang TC", "Rockwell", "Savoye LET", "Sinhala Sangam MN", "Snell Roundhand", "Symbol", "Tamil Sangam MN", "Thonburi", "Times New Roman", "Trebuchet MS", "Verdana", "Zapf Dingbats", "Zapfino"]
    
    var labelText : String = "You Can Easily Change Font 🥳 Yazı Stilini Kolaylıkla Değitirebilirsin 😜 Siz Asanlıqla Fot Dəyişə Bilərsiniz 🤪 Vous Pouvez Facilement Changer De Pied 😝 μπορείτε εύκολα να αλλάξετε γραμματοσειρά 🧐"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appLabel.text = labelText
        // Do any additional setup after loading the view.
    }

    
    @IBAction func changeButtonPressed(_ sender: UIButton) {
        var n1 = fontNames.count
        var n = Int.random(in: 0 ... n1-1)
        let fontName = fontNames[n]
        appLabel.font = UIFont(name: fontName, size: 15.0
        )
    }
    

}

