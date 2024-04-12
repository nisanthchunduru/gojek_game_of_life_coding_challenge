# Game of Life

My solution for [Gojek's](http://gojekengineering.com/) Game of Life coding challenge at Ruby Conf India

## Installation & Usage

Clone this github repo

```
git@github.com:nisanth074/gojek-rci-challenge.git
```

Install the required gems with bundler

```
cd gojek-rci-challenge/
bundle install --path vendor/bundle
```

and then run

```
./game_of_life.rb seed.text
```

The script should output something like

```
% ./game_of_life.rb seed.txt
0 0 0 0
0 1 1 0
0 1 1 0
0 0 0 0
```

## Specs

Specs are written in rspec

```
bundle exec rspec spec/
```

## TODO

Most of these TODOs are artificial conditions required by the Gojek challenge

- [x] Remove if conditionals
- [ ] Stop mutating variables
- [ ] Remove loops
- [ ] Add Travis CI
