module Main where

import Debug.Trace(trace)
import ReadSTL
import DisplaySTL
import Cube
import ColorRing
import Vertex
import Data.IORef
import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import System.Exit

-- displayPoints :: [(Float, Float, Float)] -> IORef GLfloat -> IO ()
-- displayPoints points radius = preservingMatrix $ do
--     r <- get radius
--     scale r r (r::GLfloat)
--     clearColor $= Color4 0.2 0.4 0.4 1
--     clear [ColorBuffer]
--     currentColor $= Color4 1.0 1.0 0.5 1
--     renderPrimitive Triangles $ mapM_ (\(x, y, z) -> vertex $ Vertex3 x y z) points
--     loadIdentity
--     flush

reshape :: IORef (Maybe Size) -> Size -> IO ()
reshape currentWindowSize s = do
    currentWindowSize $= Just s
    -- putStrLn $ "window resized to " ++ show s
    viewport $= (Position 0 0, s)

quit :: IO()
quit = do
    exitWith ExitSuccess

keyboard :: Key -> KeyState -> Modifiers -> Position -> IO()
keyboard (Char '\ESC') Up _ _ =
    quit
-- keyboard radius (Char '+') Down _ _ = do
--   r <- get radius
--   radius $= r + 0.05
--   postRedisplay Nothing
-- keyboard radius (Char '-') Down _ _ = do
--   r <- get radius
--   radius $= r - 0.05
--   postRedisplay Nothing
keyboard _ _ _ _ = return ()

passiveMouse :: IORef Float -> IORef Float -> Position -> IO ()
passiveMouse anglx angly (Position x y) = do
    anglx $= fromIntegral x
    angly $= fromIntegral y

main :: IO ()
main = do
    getArgsAndInitialize
    initialDisplayMode $= [WithDepthBuffer, DoubleBuffered]
    createWindow "stl-renderer"
    windowSize $= Size 800 500
    anglx <- newIORef 0.0
    angly <- newIORef 0.0

    currentWindowSize <- newIORef (Nothing :: Maybe Size)
    depthFunc $= Just Less
    points <- readFile "../resources/CSG-modules.stl" >>= (return . parsePoints)
    -- putStrLn $ unlines $ map show points
    displayCallback $= displaySTL points anglx angly
    reshapeCallback $= Just (reshape currentWindowSize)
    keyboardMouseCallback $= Just keyboard
    passiveMotionCallback $= Just (passiveMouse anglx angly)
    matrixMode $= Projection
    loadIdentity
    -- let near   = 1
    --     far    = 40
    --     right  = 1
    --     top    = 1
    -- frustum (-right) right (-top) top near far
    matrixMode $= Modelview 0
    mainLoop

-- todo
--   control the camera
--   use viewport to display a front, side, and top view of the thing


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
