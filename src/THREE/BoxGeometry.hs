-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | BoxGeometry is a geometry class for a rectangular cuboid with a given
-- 'width', 'height', and 'depth'.
--
-- - https://threejs.org/docs/#api/en/geometries/BoxGeometry
-- - https://github.com/mrdoob/three.js/blob/master/src/geometries/BoxGeometry.js
module THREE.BoxGeometry
  ( -- * Types
    BoxGeometry (..)
    -- * Constructors
  , THREE.BoxGeometry.new
  , THREE.BoxGeometry.new'
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
  , copy
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Control.Monad
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.BufferGeometry as THREE
import           THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/geometries/BoxGeometry
newtype BoxGeometry
  = BoxGeometry
  { unBoxGeometry :: JSVal
  } deriving (MakeArgs, MakeObject, ToJSVal) 
    deriving newtype BufferGeometryC
-----------------------------------------------------------------------------
-- Constructors
-----------------------------------------------------------------------------
new :: JSM BoxGeometry
new = THREE.new' BoxGeometry "BoxGeometry" ()
-----------------------------------------------------------------------------
new' :: Double -> Double -> Double -> Int -> Int -> Int -> JSM BoxGeometry
new' with' height' depth' widthSegments' heightSegments' depthSegments' = 
  THREE.new' BoxGeometry "BoxGeometry" (with', height', depth', widthSegments', heightSegments', depthSegments')
-----------------------------------------------------------------------------
-- Read-only properties
-----------------------------------------------------------------------------
-- Properties
-----------------------------------------------------------------------------
-- Optional properties
-----------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------
copy :: BoxGeometry -> BoxGeometry -> JSM ()
copy (BoxGeometry v) x = void $ v # ("copy" :: JSString) $ x
-----------------------------------------------------------------------------
-- Helper functions
-----------------------------------------------------------------------------
