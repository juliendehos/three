-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | This is used internally by PointLights for calculating shadows.
--
-- - https://threejs.org/docs/#api/en/lights/shadows/PointLightShadow
-- - https://github.com/mrdoob/three.js/blob/master/src/lights/PointLightShadow.js
module THREE.PointLightShadow
  ( -- * Types
    PointLightShadow (..)
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
import           THREE.LightShadow as THREE
import           THREE.Object3D as THREE
-----------------------------------------------------------------------------
newtype PointLightShadow
  = PointLightShadow
  { unPointLightShadow :: JSVal
  } deriving (MakeArgs, MakeObject, ToJSVal) 
    deriving newtype LightShadowC
    deriving Object3DC via JSVal
-----------------------------------------------------------------------------
instance FromJSVal PointLightShadow where
  fromJSVal = pure .Just . PointLightShadow
-----------------------------------------------------------------------------
-- Constructors
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
-- Methods
-- TODO updateMatrices?
-----------------------------------------------------------------------------
-- Helper functions
-----------------------------------------------------------------------------
