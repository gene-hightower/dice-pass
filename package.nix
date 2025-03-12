{ stdenv
, fetchFromGitHub
, boost
, gflags
}:

stdenv.mkDerivation {
  name = "dice-pass";
  version = "0.0";

  src = fetchFromGitHub {
    owner = "gene-hightower";
    repo = "dicepass";
    rev = "2e4447ec597a1737317b20fa0f57292d28660cdc";
    sha256 = "sha256-NGnyoHoo3pS5SkdvZGVP8x9dZYE7F5zxULTtheHGcGA=";
  };

  buildInputs = [ boost ];
}
