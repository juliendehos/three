-----------------------------------------------------------------------------
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | Handles and keeps track of loaded and pending data.
--
-- - https://threejs.org/docs/index.html#api/en/loaders/managers/LoadingManager
-- - https://github.com/mrdoob/three.js/blob/master/src/loaders/LoadingManager.js
module THREE.LoadingManager
  ( -- * Types
    LoadingManager (..)
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
newtype LoadingManager 
  = LoadingManager
  { unLoadingManager :: JSVal
  } deriving (MakeObject, ToJSVal, MakeArgs)
-----------------------------------------------------------------------------
instance FromJSVal LoadingManager where
  fromJSVal = pure .Just . LoadingManager
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

