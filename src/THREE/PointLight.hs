-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | A light that gets emitted from a single point in all directions. A common
-- use case for this is to replicate the light emitted from a bare lightbulb.
--
-- - https://threejs.org/docs/#api/en/lights/PointLight
-- - https://github.com/mrdoob/three.js/blob/master/src/lights/PointLight.js
module THREE.PointLight
  ( -- * Types
    PointLight (..)
    -- * Constructors
  , THREE.PointLight.new
  , THREE.PointLight.new'
    -- * Read-only Properties
    -- * Properties
  , getDistance
  , setDistance
  , modifyDistance
  , getDecay
  , setDecay
  , modifyDecay
  , getPower
  , setPower
  , modifyPower
  , getShadow
  , setShadow
    -- * Optional properties
    -- * Methods
  , copy
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Control.Monad
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Internal as THREE
import           THREE.Light as THREE
import           THREE.Object3D as THREE
import           THREE.PointLightShadow as THREE
-----------------------------------------------------------------------------
newtype PointLight
  = PointLight
  { unPointLight :: JSVal
  } deriving (MakeArgs, MakeObject, ToJSVal) 
    deriving newtype LightC
    deriving Object3DC via JSVal
-----------------------------------------------------------------------------
-- Constructors
-----------------------------------------------------------------------------
new :: JSM PointLight
new = THREE.new' PointLight "PointLight" ()
-----------------------------------------------------------------------------
new' :: Int -> Double -> Double -> Double -> JSM PointLight
new' color' intensity' distance' decay' = 
  THREE.new' PointLight "PointLight" (color', intensity', distance', decay')
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
getDistance :: PointLight -> JSM Double
getDistance = mkGet "distance"
-----------------------------------------------------------------------------
setDistance :: Double -> PointLight -> JSM ()
setDistance = mkSet "distance"
-----------------------------------------------------------------------------
modifyDistance :: (Double -> JSM Double) -> PointLight -> JSM Double
modifyDistance = mkModify "distance"
-----------------------------------------------------------------------------
getDecay :: PointLight -> JSM Double
getDecay = mkGet "decay"
-----------------------------------------------------------------------------
setDecay :: Double -> PointLight -> JSM ()
setDecay = mkSet "decay"
-----------------------------------------------------------------------------
modifyDecay :: (Double -> JSM Double) -> PointLight -> JSM Double
modifyDecay = mkModify "decay"
-----------------------------------------------------------------------------
getPower :: PointLight -> JSM Double
getPower = mkGet "power"
-----------------------------------------------------------------------------
setPower :: Double -> PointLight -> JSM ()
setPower = mkSet "power"
-----------------------------------------------------------------------------
modifyPower :: (Double -> JSM Double) -> PointLight -> JSM Double
modifyPower = mkModify "power"
-----------------------------------------------------------------------------
getShadow :: PointLight -> JSM PointLightShadow
getShadow = mkGet "shadow"
-----------------------------------------------------------------------------
setShadow :: PointLightShadow -> PointLight -> JSM ()
setShadow = mkSet "shadow"
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------
copy :: PointLight -> PointLight -> JSM ()
copy (PointLight v) x = void $ v # ("copy" :: JSString) $ x
-----------------------------------------------------------------------------
-- Helper functions
-----------------------------------------------------------------------------
