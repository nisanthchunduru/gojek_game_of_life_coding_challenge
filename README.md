# Game of Life

My solution for Gojek's Game of Life challenge http://gojekengineering.com/

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

The output should be something like

```
% ./game_of_life.rb seed.txt
0 0 0 0
0 1 1 0
0 1 1 0
0 0 0 0
```