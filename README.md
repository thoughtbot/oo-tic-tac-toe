# OO Tic Tac Toe

This is an exercise in TDD-ing and OO Design. It's broken into 7 features:

## Features


1. When you run ruby `oo-tic-tac-toe/game_runner.rb`, an empty grid is rendered on the screen.
```
   __ __ __
  |  |  |  |
  |__|__|__|
  |  |  |  |
  |__|__|__|
  |  |  |  |
  |__|__|__|
```
2. When you render the grid there are numbers above each column and letters to the left of each row that can be used to identify to tell the program where to put the next mark.
```
   1  2  3
   __ __ __
A |  |  |  |
  |__|__|__|
B |  |  |  |
  |__|__|__|
C |  |  |  |
  |__|__|__|
```
3. The app waits for user input after rendering the screen with a prompt asking for coordinates. When the user enters a good coordinate the app quits. When the user enters bad coordinates, the application returns a message about not understanding the message, then waits for good input. The application doesn’t quit until the user enters good information. Coordinates are a row letter combined with a column number, for example: `A2`, `B3`.
4. Given the app renders an empty board and then waits for good input, we want to continue with that flow, but instead of quitting on good input, it renders the board with an X inside the box. After that it quits.
```
   1  2  3
   __ __ __
A |  |  |  |
  |__|__|__|
B |  |  |  |
  |__|__|__|
C |  |  |  |
  |__|__|__|

Enter your move > B2

   1  2  3
   __ __ __
A |  |  |  |
  |__|__|__|
B |  |X |  |
  |__|__|__|
C |  |  |  |
  |__|__|__|
```
5. The computer player enters the next move. It will put an O in a random location not chosen by the user. Then it re-renders the board and quits.
6. The game goes back and forth between waiting for user input and automatically filling a square until all the board is filled in, regardless of a win. The game quits after the board is full. Coordinates with a mark in them already are not valid entries.
7. The game exits early if someone wins. The exiting message indicates which player won.

## Technique

### TDD and the testing pyramid
This exercise is about TDD. It is also about the testing pyramid. You will want to start with a high level test that mocks out `stdin` and `stdout` and then build out unit tests as soon as you have new classes and objects.

The goal of the exercise is not to struggle with testing `puts` and `gets`, so here is the rough guide to stubbing/mocking those streams:

* Dependency inject. Pass in `stdin` and `stdout` so you can pass in an alternative.
* Pass in a [StringIO](https://www.rubyguides.com/2017/05/stringio-objects/) instead of those streams during tests!
* You can get to the contents of the output with `mock_stdout.string` and use that to test that the application puts out the content that is expected.
* You can stub `gets` with `allow(mock_stdin).to receive(:gets).and_return("what the user entered")`

The exercise is setup with `rspec` default configuration and directory. The rest of the structure is up to you.

Write tests first, do the bare minimum to make them pass. In the first two features, you can dive down into loads of logic, but the application doesn't have any real logic yet. Keep it stupid simple. You will end up at a different place than if you worry up front about the logic that is coming.

### Design guides
It's pretty easy to throw a script into the middle of an object. That isn't this exercise. Instead you can use some basic design rules to get to OO.

* A method can't be more than 5 lines long
* Don't use local variables, make methods instead that capture that logic (and memoize if necessary)
* Name your methods well, and notice when the names start to group together. It's probably a missing class.
* Arguments to methods may be a sign of a missing object. This is particularly true when you need to pass the same argument around to several methods
* The inside of loops are also candidates for seprate objects, since they have different state than outside the container
* When using the private demarkation, maybe you just need another class that is inherently private
* Pay attention to the colors and shapes in your IDE. Methods with similar colors and shapes typically belong together, and ones that are very different can be a smell.

### Process
#### Choose a mentor
Find someone who can very quickly do this exercise and following the design guides to get to an OO app.

#### Start your feature with a failing acceptance test
For that feature, start with a failing acceptance test. This is where you will want to mock out `stdin` and `stdout`. Make a PR with this first failing acceptance test so you can ensure the backbone of your testing is setup correctly.

#### Make the test pass
You got this. Keep it simple. Only make it pass without worrying about the features that are coming. Make a PR with that stupid simple solution.

#### Apply your design guides to the result
Go through each of the rules and see which ones feel like a fit for any given area. Make a PR that extracts methods, classes, etc. As you extract classes, write unit tests that increase coverage by having the tests very close to the code.

#### Repeat more tightly
After the first couple of features, or however long it takes to get into a green-red-refactor cadance, switch to doing smaller PRs that incorporate this three part flow. You will start to get more typcial feedback from your mentor that talks about how to improve the tests, better cover the feature, or improve the refactoring.


