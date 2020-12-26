Original data file was obtained from
  http://data.huffingtonpost.com/2014/world-cup
and reformatted as germany-vs-argentina-players.txt, germany-vs-argentina.txt, 
and cl-shots-2012.txt


germany-vs-argentina-players.txt file includes the player's information from both
Germany's team and Argentina's team.
Line 1 is a header; the remaining lines are each a record with multiple fields.
Field 1: 4 or 5-digits playerID
Field 2: Player's full name
Field 3: Player's preferred foot
Field 4: Player's role in the team
Field 5: The team to which the player belongs


germany-vs-argentina.txt file includes the events data during the first half of 
the game between Germany and Argentina.  The events are listed in ascending order
by the time of the event.
Line 1 is a header; the remaining lines are each a record with multiple fields.
Field 1: 4 or 5-digits player's ID
Field 2: whether the event was a success (1-success, 0- fail)
Field 3: the time when the event happened (min)
Field 4: the time when the event happened (sec)
Field 5: x position of the player when the event started
Field 6: y position of the player when the event started
Field 7: x position of the player when the event ended
Field 8: y position of the player when the event ended
Field 9: whether the event crossed over to the other half of the field
Field 10: event ID corresponding to the type of the event (check the list below)
Field 11: The team to which the player belongs


cl-shots-2012.txt file includes the 2273 shots data during the 2012 UEFA Champions League
Line 1 is a header; the remaining lines are each a record with multiple fields.
Field 1: the distance in meters between the postion where the player shot and the goal
Field 2: the relative movement along x-axis before the player shot 
Field 3: the relative movement along y-axis before the player shot
Field 4: whether the shot resulted in a goal
Field 5: the player who shot
Field 6: whether it was a shot (all 'True' in this case)
Field 7: the team to which the player belongs
Field 8: the x position when the player possessed the ball
Field 9: the y position when the player possessed the ball   


Event type lists:
EventID : Name
1: 'PASS'
2: 'OFFSIDE PASS'
3: 'DRIBBLE'
4: 'FOUL (1-ON, 0-BY)'
5: 'PLAY_ACTORS'
6: 'CORNER (1-WON, 0-GRANTED)'
7: 'TACKLE', 8:'INTERCEPTION'
10: 'SAVE/BLOCK'
11: 'GK GRAB BALL'
12: 'INTERCEPTION (NO CONTROL)'
13: 'SHOT OFF GOAL'
14: 'SHOT HIT POST'
15: 'SHOT ON GOAL'
16: 'GOAL'
17: 'YELLOW CARD'
18: 'SUBSTITUTION (OFF)'
19: 'SUBSTITUTION (ON)'
41: 'GK PUNCH'
42: 'something awesome'
44:'HEADING DUEL'
45: 'TACKLE (MISSED)'
49: 'WON CONTROL OF BALL'
50:'LOST CONTROL OF BALL'
51:'INTERCEPTION (MISSED)'
52: 'gk action'
55:'offside defender'
9: 'gk action'
61: 'LOST CONTROL OF BALL'
74: 'CLEAR BALL (OUT OF PITCH)'
100: 'RECEPTION'
101: 'RUN WITH BALL'
102: 'LINEUP'
