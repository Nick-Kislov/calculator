import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber: Double = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                // Text display
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                    
                }
                .padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item) / 2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .equal {
                let currentValue = Double(self.value) ?? 0
                switch self.currentOperation {
                case .add:
                    self.value = "\(self.runningNumber + currentValue)"
                case .subtract:
                    self.value = "\(self.runningNumber - currentValue)"
                case .multiply:
                    self.value = "\(self.runningNumber * currentValue)"
                case .divide:
                    self.value = "\(self.runningNumber / currentValue)"
                case .none:
                    break
                }
                self.currentOperation = .none
            } else {
                self.currentOperation = {
                    switch button {
                    case .add: return .add
                    case .subtract: return .subtract
                    case .multiply: return .multiply
                    case .divide: return .divide
                    default: return .none
                    }
                }()
                self.runningNumber = Double(self.value) ?? 0
                self.value = "0"
            }
        case .clear:
            self.value = "0"
            self.runningNumber = 0
            self.currentOperation = .none
        case .decimal:
            if !self.value.contains(".") {
                self.value += "."
            }
        case .negative:
            if self.value != "0" {
                if self.value.hasPrefix("-") {
                    self.value.removeFirst()
                } else {
                    self.value = "-\(self.value)"
                }
            }
        case .percent:
            if let value = Double(self.value) {
                self.value = "\(value / 100)"
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}

#Preview {
    ContentView()
}

