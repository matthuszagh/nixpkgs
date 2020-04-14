{ stdenv
, fetchurl
, buildPythonPackage
, linux-gpib
}:

buildPythonPackage rec  {
  pname = "python-linux-gpib";
  version = "4.3.4";

  src = fetchurl {
    url = "https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/${version}/linux-gpib-${version}.tar.gz";
    sha256 = "sha256-NWA4WvnlIMpyBZEDlUjKhmwLTcKab6CbpIxTdtsfMM4=";
  };

  unpackPhase = ''
    tar xf $src
    tar xf linux-gpib-${version}/linux-gpib-user-${version}.tar.gz
  '';

  buildInputs = [
    linux-gpib
  ];

  sourceRoot = "linux-gpib-user-${version}/language/python";

  pythonImportsCheck = [ "gpib" ];
}
