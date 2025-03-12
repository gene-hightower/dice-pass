{ stdenv
, fetchFromGitHub
, boost
, gflags
}:

stdenv.mkDerivation {
  name = "dice-pass-unstable";
  version = "2025-03-12";

  src = fetchFromGitHub {
    owner = "gene-hightower";
    repo = "dicepass";
    rev = "47e9206e4b446f75b239eca339bbbb671c83a761";
    sha256 = "sha256-HHSXdAHWlQFdYXkkF4pHBcCGBBEeYP6wF5bTVWX/ni4=";
  };

  buildInputs = [ boost ];
}
