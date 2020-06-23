# TerminalUI

Basic class for implementing an option-based terminal UI for functions in Swift.

Allows a developer to specify an arbitrary amount of options representing functions to have the user select from. Each option may call a function provided as a closure (or function reference) via the `addOption()` method. The function is called without parameters and must return `Void`. To use, create an instance of `TerminalUI` and use the `addOption` method to add function options. Execute the `showUI` method to begin the main program loop.

## Supported Platforms

macOS 10.15, Xcode 11

## Contact

Cole Pearson <cole@colejpearson.com>

## License

Copyright © 2020 Cole Pearson. Available under the MIT License. See LICENSE for details.
