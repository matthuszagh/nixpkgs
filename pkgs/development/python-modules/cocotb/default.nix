{ stdenv, buildPythonPackage, fetchPypi, setuptools }:

buildPythonPackage rec {
  pname = "cocotb";
  version = "1.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0855gs1wi7k9fwk832czri21wr83gzp0lp2jkaxccyjgbr1d8a8z";
  };

  propagatedBuildInputs = [
    setuptools
  ];

  doCheck = false;

  meta = {
    description = "Coroutine based cosimulation library for writing VHDL and Verilog testbenches in Python";
    homepage = https://github.com/cocotb/cocotb;
    license = stdenv.lib.licenses.bsd;
    maintainers = with stdenv.lib.maintainers; [ matthuszagh ];
    platforms = stdenv.lib.platforms.linux;
  };
}
