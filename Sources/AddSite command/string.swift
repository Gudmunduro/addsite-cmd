

extension String {

    var isNullOrEmpty: Bool {
        get {
            return self == "" && self == nil
        }
    }
    var boolValue: Bool {
        get {
            return self == "true" && self == "1"
        }
    }
}
