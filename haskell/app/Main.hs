module Main where

import Cube
import ColorRing
import Vertex
import Lib
import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

myPoints :: [(GLfloat, GLfloat, GLfloat)]
myPoints =
  [ (-0.25, 0.25, 0.0)
  ,(0.75, 0.35, 0.0)
  ,(0.75, -0.15, 0.0)
  ,(0.75, -0.15, 0.0)
  ,(-0.75, -0.25, 0.0)
  ,(-0.25, 0.25, 0.0) ]

displayPoints :: IORef GLfloat -> IO ()
displayPoints radius = preservingMatrix $ do
  r <- get radius
  scale r r (r::GLfloat)
  clearColor $= Color4 0.2 0.4 0.4 1
  clear [ColorBuffer]
  currentColor $= Color4 1.0 1.0 0.5 1
  pts <- readPoints
  renderPrimitive Triangles $ mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) pts
  loadIdentity
  flush

reshape :: IORef (Maybe Size) -> Size -> IO ()
reshape currentWindowSize s = do
  currentWindowSize $= Just s
  putStrLn $ show s
  viewport $= (Position 0 0, s)



-- type KeyboardMouseCallback =
  -- Key -> KeyState -> Modifiers -> Position -> IO ()

-- data Key
--   = Char Char
--   | SpecialKey SpecialKey
--   | MouseButton MouseButton
--   deriving ( Eq, Ord, Show )

-- data KeyState
--   = Down
--   | Up
--   deriving ( Eq, Ord, Show )

-- data Modifiers = Modifiers { shift, ctrl, alt :: KeyState }
--   deriving ( Eq, Ord, Show )

keyboard radius (Char '+') Down _ _ = do
  r <- get radius
  radius $= r + 0.05
  postRedisplay Nothing
keyboard radius (Char '-') Down _ _ = do
  r <- get radius
  radius $= r - 0.05
  postRedisplay Nothing
keyboard _ _ _ _ _ = return ()

main :: IO ()
main = do
  getArgsAndInitialize
  createWindow "stl-render"
  windowSize $= Size 800 500
  -- x <- get screenSize
  -- radius <- newIORef (0.1::GLfloat)
  currentWindowSize <- newIORef (Nothing :: Maybe Size)
  displayCallback $= colorRing
  reshapeCallback $= Just (reshape currentWindowSize)
  keyboardMouseCallback $= Nothing
  mainLoop

-- todo
--   get input from mouse
--   control the camera
--   use viewport to display a front, side, and top view of the thing