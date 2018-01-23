module GameState where 

-- | Alias of Int tuples, single tile on board 
type Position = (Int, Int)

-- | Direction of snake
data Orientation = Up |
                   Right |
                   Down |
                   Left
				   deriving (Eq, Show)

-- | Enum for Orientation
orientationToInt :: Orientation -> Int
orientationToInt x | x == GameState.Up = 0
                   | x == GameState.Right = 1
                   | x == GameState.Down = 2
                   | x == GameState.Left = 3

-- | Converting Orientation to Position in which snake should go
orientationToPosition :: Orientation -> Position
orientationToPosition x | x == GameState.Up = (0,1)
                        | x == GameState.Right = (1,0)
                        | x == GameState.Down = (0,-1)
                        | x == GameState.Left = (-1,0)

-- | Data about state of the game
data GameState = Game { 
 snakeBody :: [Position], -- ^ List containing positions of snake
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