module Paths_snake (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/wojtek/.cabal/bin"
libdir     = "/home/wojtek/.cabal/lib/x86_64-linux-ghc-7.10.3/snake-0.1.0.0-0e29lKZ4HwJ7t9eNyp1qrN"
datadir    = "/home/wojtek/.cabal/share/x86_64-linux-ghc-7.10.3/snake-0.1.0.0"
libexecdir = "/home/wojtek/.cabal/libexec"
sysconfdir = "/home/wojtek/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snake_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snake_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "snake_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snake_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snake_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
