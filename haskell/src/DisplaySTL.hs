module DisplaySTL(displaySTL) where

import Vertex
import Control.Monad
import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Cube

displaySTL :: [(Float, Float, Float)] -> IORef (Maybe Size) -> IORef Float -> IORef Float -> IO ()
displaySTL points currentWindowSize anglx angly = do
  loadIdentity
  clearColor $= Color4 0.2 0.4 0.4 1
  clear [ColorBuffer, DepthBuffer]
  Just (Size w h) <- get currentWindowSize
  currentColor $= Color4 1.0 1.0 0.5 1
  ax <- get anglx
  ay <- get angly
  scale 0.05 0.05 (0.05::GLfloat)
  rotate ax $ Vector3 0 1 0
  rotate ay $ Vector3 1 0 0
  translate (Vector3 0 0 (2::GLfloat))
  renderPrimitive Triangles $ mapM_ vertex3f points
  swapBuffers
  flush
  postRedisplay Nothing

-- use the points from ReadSTL.readPoints and show a wireframe of the triangles