# Simple Calculator App in Swift

This document describes the implementation of a simple calculator app using Swift and SwiftUI, styled to match the iOS design language.

## Features

- Basic arithmetic operations: addition, subtraction, multiplication, and division.
- Support for decimal numbers.
- Ability to toggle between positive and negative numbers.
- Percentage calculations.
- Clear functionality to reset the calculator.

## User Interface

The calculator interface consists of a display area and a grid of buttons. The buttons are styled to match the iOS design language, with different colors for numbers, operations, and special functions.

### Display Area

The display area shows the current input or result of the calculation. It is styled with a large, bold font and aligned to the right.

### Buttons

The buttons are arranged in a grid layout with the following rows:

1. Clear, Toggle Sign, Percent, Divide
2. 7, 8, 9, Multiply
3. 4, 5, 6, Subtract
4. 1, 2, 3, Add
5. 0, Decimal, Equal

Each button has a distinct color based on its function:
- Numbers: Dark gray
- Operations: Orange
- Special functions (Clear, Toggle Sign, Percent): Light gray
