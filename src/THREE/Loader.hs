-----------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | Base class for implementing loaders.
--
-- - https://threejs.org/docs/#api/en/loaders/Loader
-- - https://github.com/mrdoob/three.js/blob/master/src/loaders/Loader.js
module THREE.Loader
  ( -- * Types
    LoaderC (..)
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
import           THREE.LoadingManager as THREE
-----------------------------------------------------------------------------
-- | https://threejs.org/docs/#api/en/loaders/Loader
class LoaderC a where
  -- read-only properties
  -- properties
  getCrossOrigin :: a -> JSM JSString
  setCrossOrigin :: JSString -> a -> JSM ()
  modifyCrossOrigin :: (JSString -> JSM JSString) -> a -> JSM JSString
  getWithCredentials :: a -> JSM Bool
  setWithCredentials :: Bool -> a -> JSM ()
  modifyWithCredentials :: (Bool -> JSM Bool) -> a -> JSM Bool
  getManager :: a -> JSM LoadingManager
  setManager :: LoadingManager -> a -> JSM ()
  getPath :: a -> JSM JSString
  setPath :: JSString -> a -> JSM ()
  modifyPath :: (JSString -> JSM JSString) -> a -> JSM JSString
  getResourcePath :: a -> JSM JSString
  setResourcePath :: JSString -> a -> JSM ()
  modifyResourcePath :: (JSString -> JSM JSString) -> a -> JSM JSString
  -- TODO requestHeader?
  -- optional properties
  -- methods
  -- TODO loadAsync?
-----------------------------------------------------------------------------
instance LoaderC JSVal where
  -- read-only properties
  -- properties
  getCrossOrigin = mkGet "crossOrigin"
  setCrossOrigin = mkSet "crossOrigin"
  modifyCrossOrigin = mkModify "crossOrigin"
  getWithCredentials = mkGet "withCredentials"
  setWithCredentials = mkSet "withCredentials"
  modifyWithCredentials = mkModify "withCredentials"
  getManager = mkGet "manager"
  setManager = mkSet "manager"
  getResourcePath = mkGet "resourcePath"
  setResourcePath = mkSet "resourcePath"
  modifyResourcePath = mkModify "resourcePath"
  getPath = mkGet "path"
  setPath = mkSet "path"
  modifyPath = mkModify "path"
  -- optional properties
  -- methods
-----------------------------------------------------------------------------
