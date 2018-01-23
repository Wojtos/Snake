module HUnitTests where

import Test.HUnit
import GameSettings
import UpdateGame
import GameState

test1 = TestCase (assertEqual "regular move" (update (1.0 / fps) state1) state1')
 where state1 = Game {
   snakeBody = [(0,0),(0,1),(1,1)],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 0
   isEnded = False
   changeOfOrientation = False
  },
   state1' = Game {
   snakeBody = [(1,0),(0,0),(0,1)],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 0
   isEnded = False
   changeOfOrientation = False
  }
test2 = TestCase (assertEqual "wall collision" (isEnded (update (1.0 / fps) state2)) true)
   where state2 = Game {
   snakeBody = [((quad sizeOfBoard 2) - 1,0)],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 0
   isEnded = False
   changeOfOrientation = False
  }
test3 = TestCase (assertEqual "ate apple" ((tilesToBeAdded (update (1.0 / fps) state3)) rewardForEatingApple)
 where state3 = Game {
   snakeBody = [(0,0),(0,1),(1,1)],
   applePos = (1,0)
   orientation = Right
   tilesToBeAdded = 0
   isEnded = False
   changeOfOrientation = False
  }
test4 = TestCase (assertEqual "move while growing" (update (1.0 / fps) state4) state4')
 where state4 = Game {
   snakeBody = [(0,0),(0,1),(1,1)],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 2
   isEnded = False
   changeOfOrientation = False
  },
   state4' = Game {
   snakeBody = [(1,0),(0,0),(0,1),(1,1)],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 1
   isEnded = False
   changeOfOrientation = False
  }
test5 = TestCase (assertEqual "collision with body"  (isEnded $ update (1.0 / fps) state5) true)
 where state5 = Game {
   snakeBody = [(0,0),(0,1),(1,1),(1,0),(1,(-1))],
   applePos = ((-1),(-1))
   orientation = Right
   tilesToBeAdded = 0
   isEnded = False
   changeOfOrientation = False
  }

testUpdate = TestList [ TestLabel "test1" test1, TestLabel "test2" test2, TestLabel "test3" test3, TestLabel "test4" test4, TestLabel "test5" test5]
