{ stdenv
, buildPythonPackage
, fetchPypi
, pythonOlder
, setuptools
, httpserver
}:

buildPythonPackage rec {
  pname = "pylibftdi";
  version = "0.17.0";
  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "132c44rs0f2zm22hnhg93p47aaw6llpfzavc64dcqrn8719mlqfw";
  };

  propagatedBuildInputs = [
    setuptools
    httpserver
  ];

  meta = with stdenv.lib; {
    homepage = https://bitbucket.org/codedstructure/pylibftdi/src/default/;
    description = "Minimal pythonic wrapper to Intra2net's libftdi driver for FTDI's USB devices";
    license = licenses.mit;
  };
}
