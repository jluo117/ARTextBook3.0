import Foundation
import UIKit
class PharView: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var allFormattedDescriptions = [
        
        Formatted(heading: "H20", descriptionText: "Water is a transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth's streams, lakes, and oceans, and the fluids of most living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients. Its chemical formula is H2O, meaning that each of its molecules contains one oxygen and two hydrogen atoms, connected by covalent bonds. Water is the name of the liquid state of H2O at standard ambient temperature and pressure. It forms precipitation in the form of rain and aerosols in the form of fog. Clouds are formed from suspended droplets of water and ice, its solid state. When finely divided, crystalline ice may precipitate in the form of snow. The gaseous state of water is steam or water vapor. Water moves continually through the water cycle of evaporation, transpiration (evapotranspiration), condensation, precipitation, and runoff, usually reaching the sea."),
    ]
    var USHist = [
        
        Formatted(heading: "Space Race", descriptionText: "The Space Race was a 20th-century competition between two Cold War rivals, the Soviet Union (USSR) and the United States (US), to achieve firsts in spaceflight capability. It had its origins in the ballistic missile-based nuclear arms race between the two nations that occurred following World War II. The technological advantage required to rapidly achieve spaceflight milestones was seen as necessary for national security, and mixed with the symbolism and ideology of the time. The Space Race led to pioneering efforts to launch artificial satellites, uncrewed space probes of the Moon, Venus, and Mars, and human spaceflight in low Earth orbit and to the Moon."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textContent = NSMutableAttributedString()
        
        
        if Current == "Chem"{
            for (index, desc) in allFormattedDescriptions.enumerated() {
                let includeLinebreak = index < allFormattedDescriptions.count - 1
                textContent.append(desc.attributeString(includeLineBreak: includeLinebreak))
            }
        }
        if Current == "US History"{
            for (index, desc) in USHist.enumerated() {
                let includeLinebreak = index < USHist.count - 1
                textContent.append(desc.attributeString(includeLineBreak: includeLinebreak))
            }
            
        }
        textView.attributedText = textContent
    }
}

struct Formatted {
    var heading: String
    var descriptionText: String
    
    var bodyParagraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        style.paragraphSpacingBefore = 6
        style.paragraphSpacing = 6
        return style
    }()
    
    var headerParagraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.paragraphSpacingBefore = 24
        return style
    }()
    
    var bodyAttributes: [NSAttributedString.Key: Any]
    var headerAttributes: [NSAttributedString.Key: Any]
    
    func attributeString(includeLineBreak: Bool = true) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(NSAttributedString(string: self.heading + "\n", attributes: self.headerAttributes))
        result.append(NSAttributedString(string: self.descriptionText, attributes: self.bodyAttributes))
        if includeLineBreak {
            result.append(NSAttributedString(string: "\n", attributes: self.bodyAttributes))
        }
        
        return result as NSAttributedString
    }
    
    init(heading: String, descriptionText: String) {
        self.heading = heading
        self.descriptionText = descriptionText
        self.bodyAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Hoefler Text", size: 14)!,
            NSAttributedString.Key.paragraphStyle: bodyParagraphStyle
        ]
        self.headerAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 22)!,
            NSAttributedString.Key.paragraphStyle: headerParagraphStyle,
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]
    }
}
