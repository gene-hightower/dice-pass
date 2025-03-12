{ stdenv
, fetchFromGitHub
, boost
}:

stdenv.mkDerivation {
  name = "gapc-unstable";
  version = "2023-07-05";

  src = fetchFromGitHub {
    owner = "gene-hightower";
    repo = "dicepass";
    rev = "8ddd2f7934b6f2aab966dc723a57e5713fe0f5d9";
    sha256 = "sha256-7P2VV9oncTaOnxVx4G27SWCpu6uEGzs6PSL9R+U9YGo=";
  };

  buildInputs = [ boost ];
}
