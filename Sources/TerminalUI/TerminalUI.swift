//
//  TerminalUI.swift
//  TerminalUI
//
//  Copyright © 2020 Cole Pearson.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

/**
 Basic class for implementing an option-based terminal UI for functions in Swift.
 
 - Author:
 Cole Pearson <cole@colejpearson.com>
 
 Allows a developer to specify an arbitrary amount of options representing functions to have the user select from. Each option may call a function provided as a closure (or function reference) via the `addOption()` method. The function is called without parameters and must return `Void`. To use, create an instance of `TerminalUI` and use the `addOption` method to add function options. Execute the `showUI` method to begin the main program loop.
 */
public struct TerminalUI {
    private var menuOptions: [MenuOption] = []
    
    private struct MenuOption {
        var optionLabel: String
        var functionCall: () -> Void
        
        init(label: String, function: @escaping () -> Void) {
            optionLabel = label
            functionCall = function
        }
    }
    
    public init() {}
    
    /**
    Adds an option to the `TerminalUI` instance.
     
     - parameters:
        - label: A `String` label to show in the UI menu for this option.
        - function: The function to call when this option is chosen.
     
     The function is called without parameters and must return void.
     */
    public mutating func addOption(label: String, function: @escaping () -> Void) {
        menuOptions.append(MenuOption(label: label, function: function))
    }
    
    /**
     Starts the terminal UI by outputting a selection menu to the console and reading the user's selection from standard in. Options are presented in a numbered list in the order added to the `TerminalUI` instance, and the user must enter the number of a valid option or `q` to quit.
     */
    public func showUI() {
        print("Choose an option:")
        var i = 1
        for option in menuOptions {
            print("\(i): \(option.optionLabel)")
            i += 1
        }
        while (true) {
            print("Type the number of your selection (Type q to exit):", terminator: " ")
            if let selection = readLine() {
                if let selectionValue = Int(selection) {
                    if selectionValue > 0 && selectionValue <= menuOptions.count {
                        menuOptions[selectionValue - 1].functionCall()
                    } else {
                        print("Invalid selection.")
                    }
                } else if selection == "q" || selection == "Q" {
                    print("Ending.")
                    return
                } else {
                    print("Please enter an integer.")
                }
            } else {
                print("Error reading option.")
            }
        }
    }
}
