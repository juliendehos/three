-----------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
-- | This is the base class for most objects in three.js and provides a set of
-- properties and methods for manipulating objects in 3D space.
--
-- - https://threejs.org/docs/index.html#api/en/core/Object3D
-- - https://github.com/mrdoob/three.js/blob/master/src/core/Object3D.js
module THREE.Object3D
  ( -- * Types
    Object3DC (..)
    -- * Constructors
    -- * Read-only Properties
    -- * Properties
    -- * Optional properties
    -- * Methods
  ) where
-----------------------------------------------------------------------------
import           Control.Monad (void)
import           Language.Javascript.JSaddle
-----------------------------------------------------------------------------
import           THREE.Euler as THREE
import           THREE.Internal as THREE
import           THREE.Material as THREE
import           THREE.Vector3 as THREE
-----------------------------------------------------------------------------
class Object3DC a where
  -- read-only properties
  id :: a -> JSM Bool
  -- properties
  getPosition :: a -> JSM Vector3
  setPosition :: Vector3 -> a -> JSM ()
  getRotation :: a -> JSM Euler
  setRotation :: Euler -> a -> JSM ()
  -- optional properties
  getCustomDistanceMaterialOpt :: a -> JSM (Maybe Material)
  setCustomDistanceMaterialOpt :: Maybe Material -> a -> JSM ()
  -- methods
  add :: (Object3DC b, MakeArgs b) => a -> b -> JSM ()
-----------------------------------------------------------------------------
instance Object3DC JSVal where
  -- read-only properties
  id = mkGet "id"
  -- properties
  getPosition = mkGet "position"
  setPosition = mkSet "position"
  getRotation = mkGet "rotation"
  setRotation = mkSet "rotation"
  -- optional properties
  getCustomDistanceMaterialOpt = mkGetOpt "customDistanceMaterial"
  setCustomDistanceMaterialOpt = mkSetOpt "customDistanceMaterial"
  -- methods
  add v x = void $ v # ("add" :: JSString) $ x
-----------------------------------------------------------------------------

