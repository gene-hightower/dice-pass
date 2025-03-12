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
    rev = "";
    sha256 = "";
  };

  buildInputs = [ boost ];
}
