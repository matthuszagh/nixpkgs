{ lib
, fetchFromGitHub
, buildPythonPackage
, cocotb
}:

buildPythonPackage rec {
  pname = "pyuvm";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "pyuvm";
    repo = "pyuvm";
    rev = version;
    sha256 = "sha256-47jMTj+ytN7HKX/ZKYpE0qT6wHdFunsCpFBLIlqybJU=";
  };

  propagatedBuildInputs = [
    cocotb
  ];

  meta = with lib; {
    homepage = https://github.com/pyuvm/pyuvm;
    description = "The UVM written in Python";
    license = licenses.asl20;
    maintainers = with maintainers; [ matthuszagh ];
  };
}
