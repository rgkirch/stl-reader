module ColorRing where

import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

colorRing :: IORef (Maybe Size) -> IO ()
colorRing currentWindowSize = do
  Just (Size w h) <- get currentWindowSize
  putStrLn $ show w ++ " " ++ show h
  -- putStrLn $ (show w) ++  (show h)
  -- mapM_ vertex$Vertex3 ([x <- ])

-- points :: [(GLfloat,GLfloat,GLfloat)]
-- points = [ (sin (2*pi*k/12), cos (2*pi*k/12), 0) | k <- [1..12] ]

-- display :: DisplayCallback
-- display = do
--   clear [ColorBuffer]
--   forM_ points $ \(x,y,z) ->
--     preservingMatrix $ do
--       color $ Color3 x y z
--       translate $ Vector3 x y z
--       cube 0.1
--   flush

-- i want to make a ring where the color is determined by position.
-- i want it to fill the window no matter the window size
-- there is not a direct way to query the size of the window
-- from this
-- http://hackage.haskell.org/package/GLUT-2.7.0.13/docs/Graphics-UI-GLUT-Initialization.html
-- A GLUT program should use the window's reshape callback to determine the true size of the window.