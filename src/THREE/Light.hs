-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | Abstract base class for lights - all other light types inherit the
-- properties and methods described here. 
--
-- - https://threejs.org/docs/index.html#api/en/lights/Light
-- - https://github.com/mrdoob/three.js/blob/master/src/lights/Light.js
module THREE.Light
  ( -- * Types
    LightC (..)
    -- * Constructors
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Control.Monad
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Color as THREE
import           THREE.Internal as THREE
import           THREE.Object3D as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/lights/Light
class Object3DC a => LightC a where
  -- read-only properties
  -- properties
  getColor :: a -> JSM Color
  setColor :: Color -> a -> JSM ()
  getIntensity :: a -> JSM Double
  setIntensity :: Double -> a -> JSM ()
  modifyIntensity :: (Double -> JSM Double) -> a -> JSM Double
  -- optional properties
  -- methods
  dispose :: a -> JSM ()
  -- TODO toJSON?
-----------------------------------------------------------------------------
instance LightC JSVal where
  -- read-only properties
  -- properties
  getColor = mkGet "color"
  setColor = mkSet "color"
  getIntensity = mkGet "intensity"
  setIntensity = mkSet "intensity"
  modifyIntensity = mkModify "intensity"
  -- optional properties
  -- methods
  dispose v = void $ v # ("dispose" :: JSString) $ ()
-----------------------------------------------------------------------------
