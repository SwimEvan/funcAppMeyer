import UIKit

class ViewController: UIViewController {
    var percent = 0
    @IBOutlet weak var pointsEarnedTextField: UITextField!
   
    @IBOutlet weak var pointsPossibleTextField: UITextField!
    
   @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    // Check if the user passed
        func checkPass(pointsEarned: Int, pointsPossible: Int) -> String {
            if pointsPossible <= 0 {
                return "Points possible must be greater than zero."
            }
            let percentage = Double(pointsEarned) / Double(pointsPossible) * 100
            return percentage >= 60 ? "You passed!" : "You did not pass."
        }

        // Determine letter grade based on percentage
        func letterGrade(percentage: Double) -> String {
            switch percentage {
            case 90...100:
                print("a")
                return "A"
                
            case 80..<90:
                print("b")
                return "B"
                
            case 70..<80:
                print("c")
                return "C"
                
            case 60..<70:
                print("d")
                return "D"
                
            default:
                print("f")
                return "F"
                
                
            }
            print(percentage)
        }

        // Calculate percentage and letter grade
        func calculateGrade(pointsEarned: Int, pointsPossible: Int) -> (Double, String) {
            let percentage = Double(pointsEarned) / Double(pointsPossible) * 100
            print(percentage)
            let grade = letterGrade(percentage: percentage)
            return (percentage, grade)
        }

        @IBAction func submitButtonTapped(_ sender: UIButton) {
            // Get user input
            guard let earnedText = pointsEarnedTextField.text,
                  let possibleText = pointsPossibleTextField.text,
                  let pointsEarned = Int(earnedText),
                  let pointsPossible = Int(possibleText)
            else {
                errorLabel.text = "Please enter valid numbers."
                return
            }

            // Clear previous error messages
            errorLabel.text = ""

            // Check pass/fail
            let passResult = checkPass(pointsEarned: pointsEarned, pointsPossible: pointsPossible)
            resultLabel.text = passResult

            // Calculate percentage and letter grade
            let (percentage, letter) = calculateGrade(pointsEarned: pointsEarned, pointsPossible: pointsPossible)
            
            resultLabel.text! += "\nPercentage: \(percentage)%"
            resultLabel.text! += "\nLetter Grade: \(letter)"
        }
    }
