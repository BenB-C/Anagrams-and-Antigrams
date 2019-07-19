# Anagrams and Antigrams

#### Epicodus Ruby and Rails - Behavior-Driven Development with Ruby Project - 2019.07.19

#### By Ben Bennett-Cauchon

## Description

A ruby program for checking if two words or phrases are anagrams or 'antigrams' (taken here to be two words or phrases that do not share any letters, instead of anagrams with opposite meanings).

## Specs

| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
| Determines when two words are anagrams. | "ruby", "bury" | "These words are anagrams." |
| Determines when two words are not anagrams. | "dog", "bog" | "These words are not anagrams." |
| Account for the possibility that words might have different cases but should still be anagrams. | "Tea", "Eat" | "These words are anagrams" |
| Rejects inputs that are not contained in words.txt. | "twx", "ruby" | "You need to input actual words!" |
| Rejects inputs that are not contained in words.txt. | "twix", "rpg" | "You need to input actual words!" |
| If words aren't anagrams, determines whether they are actually antigrams. | "hi", "bye" | "These words have no letter matches and are antigrams." |
| Accounts for multiple words being anagrams. | "Dormitory", "Dirty room" | "These phrases are anagrams." |
| Accounts for multiple words being anagrams. | "Voices rant on", "Conversation" | "These phrases are anagrams." |
| Accounts for multiple words being antigrams. | "A cat ate", "My dog" | "These phrases have no letter matches and are antigrams." |
| Rejects multiple words that do not contain vowels or y. | "Drmtr", "Drt rm" | "You need to input actual words!" |


## Setup/Installation Requirements

* Download/clone the repository
* Open a terminal/command line and navigate to the repo folder.
* Run the command 'bundle install'
* Run the command 'ruby anagrams_and_antigrams_script.rb'

## Known Bugs

There are no known bugs at this time.

## Support and contact details

If you find a bug, run into any issues, or have questions, ideas or concerns please feel free to submit an issue for the project here on GitHub or email me at benjamin.bennett-cauchon@gmail.com.

## Technologies Used

* ruby
  * custom classes, attr_reader methods, class variables
  * notable core classes: Hash, File
  * gems: rspec, pry, colorize, json

### License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019 Benjamin Bennett-Cauchon
