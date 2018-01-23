module GameState where 

-- | Alias of Int tuples, single tile on board 
type Position = (Int, Int)

-- | Direction of snake
data Orientation = Up |
                   Right |
                   Down |
                   Left
				   deriving (Eq, Show)

-- | Converts Orientation to Int, used to compare orientations
orientationToInt :: Orientation -> Int
orientationToInt x | x == GameState.Up = 0
                   | x == GameState.Right = 1
                   | x == GameState.Down = 2
                   | x == GameState.Left = 3

-- | Converts Orientation to Position, used to calculate snakes movement
orientationToPosition :: Orientation -> Position
orientationToPosition x | x == GameState.Up = (0,1)
                        | x == GameState.Right = (1,0)
                        | x == GameState.Down = (0,-1)
                        | x == GameState.Left = (-1,0)

-- | Data containing information about current state of the game
data GameState = Game { 
 snakeBody :: [Position],
 applePos :: Position,
 orientation :: Orientation,
 tilesToBeAdded :: Int,
 isEnded :: Bool,
 changeOfOrientation :: Bool
} deriving (Eq, Show)

-- | GameState at the begining of the game
initialGameState :: GameState 
initialGameState = Game {
 snakeBody = [(0, 0)],
 applePos = (1, 0),
 orientation = GameState.Left,
 tilesToBeAdded = 3,
 isEnded = False,
 changeOfOrientation = False
} 