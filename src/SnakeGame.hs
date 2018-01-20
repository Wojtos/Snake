type Postion = (Int, Int)

data Orientation = Up |
                   Right |
                   Down |
                   Left
                   deriving Eq

orientationToInt :: Orientation -> Int
orientationToInt x | x == Up = 0
                   | x == Main.Right = 1
                   | x == Down = 2
                   | x == Main.Left = 3

data SnakeGame = Game
 { snakeBody :: [Postion]
 , applePos :: Postion
 , orientation :: Orientation
 } 