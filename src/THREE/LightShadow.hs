-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | Serves as a base class for the other shadow classes.
--
-- - https://threejs.org/docs/index.html#api/en/lights/shadows/LightShadow
-- - https://github.com/mrdoob/three.js/blob/master/src/lights/LightShadow.js
module THREE.LightShadow
  ( -- * Types
    LightShadowC (..)
    -- * Constructors
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Internal as THREE
-----------------------------------------------------------------------------
class LightShadowC a where
  -- read-only properties
  -- properties
  getBias :: a -> JSM Double
  setBias :: Double -> a -> JSM ()
  modifyBias :: (Double -> JSM Double) -> a -> JSM Double
  -- optional properties
  -- methods
-----------------------------------------------------------------------------
instance LightShadowC JSVal where
  -- read-only properties
  -- properties
  getBias = mkGet "bias"
  setBias = mkSet "bias"
  modifyBias = mkModify "bias"
  -- optional properties
  -- methods
-----------------------------------------------------------------------------
