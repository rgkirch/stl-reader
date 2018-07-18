module DisplaySTL(displaySTL) where

import Vertex
import Control.Monad
import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Cube

renderWithShading  :: [(Float, Float, Float)] -> IO ()
renderWithShading points = renderPrimitive Triangles $ mapM_ vertex3f points

displaySTL :: [(Float, Float, Float)] -> IORef Float -> IORef Float -> IO ()
displaySTL points anglx angly = do
  loadIdentity
  clearColor $= Color4 0.2 0.4 0.4 1
  clear [ColorBuffer, DepthBuffer]
  currentColor $= Color4 1.0 1.0 0.5 1
  ax <- get anglx
  ay <- get angly
  scale 0.05 0.05 (0.05::GLfloat)
  rotate ax $ Vector3 0 1 0
  rotate ay $ Vector3 1 0 0
  translate (Vector3 0 0 (-10::GLfloat))
  renderWithShading points
  swapBuffers
  flush
  postRedisplay Nothing

-- color :: (Vector3, Vector3, Vector3)
-- color

-- add shading


-- don't pass in angle
--   why rotate the geometry in display stl?
--   geometry should be 'fixed' while camera rotates outside this function