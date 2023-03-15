# README
This project creates an items & taxes calculation program in ruby, using Json files as input.

## Technical details
* Ruby 3.2.1
* RSpec 3
* JSON
* Git

## Development environment
* Macbook Pro 2021 M1 16GB MacOS Ventura 13.1
* Iterm2 

## Installation
1) Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) installed and clone the repository with the next command
```bash
git clone https://github.com/carlos-41/subscribe_challenge
```
2) You need to have Ruby installed in your machine, in order to achieve this we installed [RVM](https://rvm.io/rvm/install) that allows us to install Ruby 3.2.1 using the next commands. 
```bash
\curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 3.2.1
rvm use 3.2.1
ruby -v
```
Output should be similar to
```bash
ruby 3.2.1 (2023-02-08 revision 31819e82c8) [arm64-darwin22]
```

Note: for detailed installation steps please see RVM documentation in the link above

3) Once you have ruby installed we need to install the required gems with
```bash
bundle install
```
Note: you might need to install rspec gem separately with
```bash
gem install rspec
```

4) Run the program using the next command
```bash
ruby lib/sales.rb
```
The code have have hardcoded the example 1 file("./examples/example-1.json"), change the file or add new files accordingly.

# Use example output
```bash
~ ruby lib/sales.rb
Input:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50

Output:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

## Next steps

* Add input error handling(throw error if items list is not correctly formatted)
* Add file validation in order to prevent FileNotFoundError
* Add more input options(API, user input)
