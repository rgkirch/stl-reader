module Main where

import Lib
import Graphics.UI.GLUT
import Graphics.Rendering.OpenGL

myPoints :: [(GLfloat, GLfloat, GLfloat)]
myPoints =
  [ (-0.25, 0.25, 0.0)
  ,(0.75, 0.35, 0.0)
  ,(0.75, -0.15, 0.0)
  ,(0.75, -0.15, 0.0)
  ,(-0.75, -0.25, 0.0)
  ,(-0.25, 0.25, 0.0) ]

displayPoints :: IO ()
displayPoints = do
    clearColor $= Color4 0.2 0.4 0.4 1
    clear [ColorBuffer]
    currentColor $= Color4 1.0 1.0 0.5 1
    renderPrimitive Triangles $ mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) myPoints
    flush

creatAWindow :: [Char] -> IO ()
creatAWindow windowName = do
    createWindow windowName
    displayCallback $= displayPoints

main :: IO ()
main = do
    getArgsAndInitialize
    creatAWindow "stl-render"
    mainLoop
