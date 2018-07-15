module Vertex where

import Graphics.Rendering.OpenGL

vertex3f :: (GLfloat, GLfloat, GLfloat) -> IO ()
vertex3f (x, y, z) = vertex $ Vertex3 x y z