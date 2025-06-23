-----------------------------------------------------------------------------
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | A representation of mesh, line, or point geometry. Includes vertex
-- positions, face indices, normals, colors, UVs, and custom attributes within
-- buffers, reducing the cost of passing all this data to the GPU. 
--
-- - https://threejs.org/docs/index.html#api/en/core/BufferGeometry
-- - https://github.com/mrdoob/three.js/blob/master/src/core/BufferGeometry.js
module THREE.BufferGeometry
  ( -- * Types
    BufferGeometryC (..)
  , BufferGeometry (..)
    -- * Constructors
    -- * Read-only properties
    -- * Properties
    -- * Optional properties
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
import           Control.Monad
import           Language.Javascript.JSaddle hiding (new)
-----------------------------------------------------------------------------
-- import           THREE.Internal as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/core/BufferGeometry
class BufferGeometryC a where
  -- methods
  getAttribute :: (FromJSVal b) => JSString -> a -> JSM (Maybe b)
  setAttribute :: (ToJSVal b) => JSString -> b -> a -> JSM ()
-----------------------------------------------------------------------------
instance BufferGeometryC JSVal where
  -- methods
  getAttribute name v = fromJSVal =<< (v # ("getAttribute" :: JSString) $ [name])
  setAttribute name x v = void $ v # ("setAttribute" :: JSString) $ (name, x)
-----------------------------------------------------------------------------
newtype BufferGeometry 
  = BufferGeometry
  { unBufferGeometry :: JSVal
  } deriving (MakeObject, ToJSVal, MakeArgs)
    deriving newtype BufferGeometryC
-----------------------------------------------------------------------------
-- constructors
-----------------------------------------------------------------------------
-- read-only properties
-----------------------------------------------------------------------------
-- properties
-----------------------------------------------------------------------------
-- optional properties
-----------------------------------------------------------------------------
-- methods
-----------------------------------------------------------------------------
-- helper functions
-----------------------------------------------------------------------------

