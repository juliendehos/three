-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | Class representing a color.
--
-- - https://threejs.org/docs/index.html#api/en/math/Color
-- - https://github.com/mrdoob/three.js/blob/master/src/math/Color.js
module THREE.Color
  ( -- * Types
    Color (..)
    -- * Constructors
    -- * Read-only properties
    -- * Properties
    -- * Optional properties
    -- * Methods
    -- * Helper functions
  ) where
-----------------------------------------------------------------------------
-- import           Control.Monad (void)
import           Language.Javascript.JSaddle hiding (new)
-----------------------------------------------------------------------------
-- import           THREE.Internal as THREE
-----------------------------------------------------------------------------
newtype Color 
  = Color
  { unColor :: JSVal
  } deriving (MakeObject, ToJSVal, MakeArgs)
-----------------------------------------------------------------------------
instance FromJSVal Color where
  fromJSVal = pure .Just . Color
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

