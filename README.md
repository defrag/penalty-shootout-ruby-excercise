penalty-shootout-ruby-excercise
===============================

Sample application using sinatra and rspec/capybara for testing.



The goal of the exercise is to build a web server for penalty shootout game, where client competes with the server. Detailed description of the football penalty shoot-out can be found here http://en.wikipedia.org/wiki/Penalty_shoot-out_(association_football) please google / ask if not sure about the rules ;)
Clients should communicate with the server through JSON API.
Features:
- server accepts request to create a new game, returns with reference and if client should shoot or save first (determined randomly)
- server accepts request for actions with a reference to the game (action is shot or save depending on the turn)
- xy coordinates (integer) of the action between (0,0) - left bottom corner and (4,2) - top right corner (ie 2,1 means a shot in the centre of the goal)
- server simulates another player request by internally generating the same coordinates at random for the corresponding action
- compares the request and determines if it was a goal or not, keeps the result
- send results back to client
- server returns the result of a given game, with any information that is required for the client to make an action (or information that game is finished)
- server handles with error messages invalid actions, as well as actions to games which are finished (there was a winner)
- Server DOES NOT have to persist the data beyond server’s process lifetime (pure ruby classes preferred to active record classes)