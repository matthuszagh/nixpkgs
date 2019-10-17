{ stdenv
, pkgs
, buildPythonPackage
, fetchPypi
, pythonOlder
, setuptools
, httpserver
, libftdi1
}:

buildPythonPackage rec {
  pname = "pylibftdi";
  version = "0.17.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "132c44rs0f2zm22hnhg93p47aaw6llpfzavc64dcqrn8719mlqfw";
  };

  propagatedBuildInputs = [
    setuptools
    httpserver
    libftdi1
    pkgs.libusb1
  ];

  doCheck = false;

  postPatch = ''
    substituteInPlace pylibftdi/driver.py --replace \
      "find_library(dll)" \
      "'${libftdi1.out}/lib/libftdi1.so' if dll in self._lib_search['libftdi'] else '${pkgs.libusb1.out}/lib/libusb-1.0.so' if dll in self._lib_search['libusb'] else find_library(dll)"
  '';

  meta = with stdenv.lib; {
    homepage = https://bitbucket.org/codedstructure/pylibftdi/src/default/;
    description = "Minimal pythonic wrapper to Intra2net's libftdi driver for FTDI's USB devices";
    license = licenses.mit;
  };
}
