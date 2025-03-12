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
    sha256 = "0blyzxjmblwn2yqgwq0y2428dh058y51f93rc5fh35fn05s9fx0w";
  };

  buildInputs = [ boost ];
}
