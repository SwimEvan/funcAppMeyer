import UIKit

    class ViewController: UIViewController {
        
    
        @IBOutlet weak var pointsEarnedTextField: UILabel!
        @IBOutlet weak var pointsPossibleTextField: UITextField!
        @IBOutlet weak var resultLabel: UILabel!
        
        @IBAction func submitButtonTapped(_ sender: UIButton) {
            guard let pointsEarned = Double(pointsEarnedTextField.text ?? ""),
                  let pointsPossible = Double(pointsPossibleTextField.text ?? ""), pointsPossible > 0 else {
                displayError()
                return
            }
            
            checkPassStatus(pointsEarned: pointsEarned, pointsPossible: pointsPossible)
            calculateAndDisplayLetterGrade(pointsEarned: pointsEarned, pointsPossible: pointsPossible)
            calculateAndDisplayPercentageAndGrade(pointsEarned: pointsEarned, pointsPossible: pointsPossible)
        }
        
        func checkPassStatus(pointsEarned: Double, pointsPossible: Double) {
            let percentage = (pointsEarned / pointsPossible) * 100
            resultLabel.text = percentage >= 60 ? "You Passed!" : "You Did Not Pass."
        }
        
        func displayError() {
            resultLabel.text = "Error: Please enter valid numbers."
        }
        
        func calculateAndDisplayLetterGrade(pointsEarned: Double, pointsPossible: Double) {
            let percentage = (pointsEarned / pointsPossible) * 100
            let letterGrade: String
            
            switch percentage {
            case 90...100:
                letterGrade = "A"
            case 80..<90:
                letterGrade = "B"
            case 70..<80:
                letterGrade = "C"
            case 60..<70:
                letterGrade = "D"
            default:
                letterGrade = "F"
            }
            
            resultLabel.text! += "\nLetter Grade: \(letterGrade)"
        }
        
        func calculateAndDisplayPercentageAndGrade(pointsEarned: Double, pointsPossible: Double) {
            let percentage = (pointsEarned / pointsPossible) * 100
            let letterGrade: String
            
            switch percentage {
            case 90...100:
                letterGrade = "A"
            case 80..<90:
                letterGrade = "B"
            case 70..<80:
                letterGrade = "C"
            case 60..<70:
                letterGrade = "D"
            default:
                letterGrade = "F"
            }
            
            resultLabel.text! += "\nPercentage: \(percentage)%\nLetter Grade: \(letterGrade)"
        }
    }

