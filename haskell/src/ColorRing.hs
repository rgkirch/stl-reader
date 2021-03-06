module ColorRing where

import Control.Monad
import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Cube

colorRing :: IORef (Maybe Size) -> IORef Float -> IORef Float -> IO ()
colorRing currentWindowSize anglx angly = do
  loadIdentity
  clearColor $= Color4 0.2 0.4 0.4 1
  clear [ColorBuffer, DepthBuffer]
  Just (Size w h) <- get currentWindowSize
  currentColor $= Color4 1.0 1.0 0.5 1
  putStrLn $ show w ++ " " ++ show h
  ax <- get anglx
  ay <- get angly
  scale 0.5 0.5 (0.5::GLfloat)
  rotate ax $ Vector3 0 1 0
  rotate ay $ Vector3 1 0 0
  forM_ (points 12) $ \(x,y,z) ->
    preservingMatrix $ do
      color $ Color3 x y z
      translate $ Vector3 x y z
      cubeFrame 0.1
  swapBuffers
  flush
  postRedisplay Nothing

  -- putStrLn $ (show w) ++  (show h)
  -- mapM_ vertex$Vertex3 ([x <- ])

points :: Int -> [(Float,Float,Float)]
points n = [ (sin (2*pi*(fromIntegral k) / (fromIntegral n)), cos (2*pi*(fromIntegral k) / (fromIntegral n)), 0) | k <- [1..n] ]

-- i want to make a ring where the color is determined by position.
-- i want it to fill the window no matter the window size
-- there is not a direct way to query the size of the window
-- from this
-- http://hackage.haskell.org/package/GLUT-2.7.0.13/docs/Graphics-UI-GLUT-Initialization.html
-- A GLUT program should use the window's reshape callback to determine the true size of the window.