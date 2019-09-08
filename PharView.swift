import Foundation
import UIKit
class PharView: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var MoreInfo: UINavigationItem!
    var allFormattedDescriptions = [
        
        Formatted(heading: "H20", descriptionText: "Water is a transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth's streams, lakes, and oceans, and the fluids of most living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients. Its chemical formula is H2O, meaning that each of its molecules contains one oxygen and two hydrogen atoms, connected by covalent bonds. Water is the name of the liquid state of H2O at standard ambient temperature and pressure. It forms precipitation in the form of rain and aerosols in the form of fog. Clouds are formed from suspended droplets of water and ice, its solid state. When finely divided, crystalline ice may precipitate in the form of snow. The gaseous state of water is steam or water vapor. Water moves continually through the water cycle of evaporation, transpiration (evapotranspiration), condensation, precipitation, and runoff, usually reaching the sea."),
    ]
    var USHist = [
        
        Formatted(heading: "Space Race", descriptionText: "The Space Race was a 20th-century competition between two Cold War rivals, the Soviet Union (USSR) and the United States (US), to achieve firsts in spaceflight capability. It had its origins in the ballistic missile-based nuclear arms race between the two nations that occurred following World War II. The technological advantage required to rapidly achieve spaceflight milestones was seen as necessary for national security, and mixed with the symbolism and ideology of the time. The Space Race led to pioneering efforts to launch artificial satellites, uncrewed space probes of the Moon, Venus, and Mars, and human spaceflight in low Earth orbit and to the Moon."),
    ]
    var LinkedList = [
        Formatted(heading: "Linked List", descriptionText: "In computer science, a Linked list is a linear collection of data elements, whose order is not given by their physical placement in memory. Instead, each element points to the next. It is a data structure consisting of a collection of nodes which together represent a sequence. In its most basic form, each node contains: data, and a reference (in other words, a link) to the next node in the sequence. This structure allows for efficient insertion or removal of elements from any position in the sequence during iteration. More complex variants add additional links, allowing more efficient insertion or removal of nodes at arbitrary positions. A drawback of linked lists is that access time is linear (and difficult to pipeline). Faster access, such as random access, is not feasible. Arrays have better cache locality compared to linked lists.")
    ]
    var Calc = [
        Formatted(heading: "Calculus", descriptionText: "Calculus, originally called infinitesimal calculus or the calculus of infinitesimals, is the mathematical study of continuous change, in the same way that geometry is the study of shape and algebra is the study of generalizations of arithmetic operations.It has two major branches, differential calculus and integral calculus. Differential calculus concerns instantaneous rates of change and the slopes of curves. Integral calculus concerns accumulation of quantities and the areas under and between curves. These two branches are related to each other by the fundamental theorem of calculus. Both branches make use of the fundamental notions of convergence of infinite sequences and infinite series to a well-defined limit.")
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
        if Current == "Comp"{
            for (index, desc) in LinkedList.enumerated() {
                let includeLinebreak = index < LinkedList.count - 1
                textContent.append(desc.attributeString(includeLineBreak: includeLinebreak))
            }
        }
        if Current == "US History"{
            for (index, desc) in USHist.enumerated() {
                let includeLinebreak = index < USHist.count - 1
                textContent.append(desc.attributeString(includeLineBreak: includeLinebreak))
            }
            
        }
        if Current == "Calc"{
            for (index, desc) in Calc.enumerated() {
                let includeLinebreak = index < Calc.count - 1
                textContent.append(desc.attributeString(includeLineBreak: includeLinebreak))
            }
        }
        MoreInfo.title = Current
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
