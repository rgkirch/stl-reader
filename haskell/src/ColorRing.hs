module ColorRing where

import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

colorRing :: IO ()
colorRing = do
  x <- get screenSize
  putStrLn $ show x
  -- putStrLn $ (show w) ++  (show h)
  -- mapM_ vertex$Vertex3 ([x <- ])

-- i want to make a ring where the color is determined by position.
-- i want it to fill the window no matter the window size
-- there is not a direct way to query the size of the window
-- from this
-- http://hackage.haskell.org/package/GLUT-2.7.0.13/docs/Graphics-UI-GLUT-Initialization.html
-- A GLUT program should use the window's reshape callback to determine the true size of the window.