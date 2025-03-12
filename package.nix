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
    rev = "120694db9b40ca0797f3ff3d9a8e5d3488611db9";
    sha256 = "1skby8xqrlybwwf7hy36ykb6s19551ghhkmbfhbfzpbzb64z5567";
  };

  buildInputs = [ boost ];
}
