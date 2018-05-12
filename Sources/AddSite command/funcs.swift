import Foundation

func YNQuestion(text: String) -> Bool
{
    print(text)
    while true {
        if let input = readLine() {
            switch input {
                case "y": return true
                case "yes": return true
                case "n": return false
                case "no": return false
                default: break
            }
        }
    }
}
