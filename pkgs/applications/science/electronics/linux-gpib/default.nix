{ stdenv
, fetchurl
}:

stdenv.mkDerivation rec {
  pname = "linux-gpib";
  version = "4.3.4";

  src = fetchurl {
    url = "https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/${version}/${pname}-${version}.tar.gz";
    sha256 = "sha256-NWA4WvnlIMpyBZEDlUjKhmwLTcKab6CbpIxTdtsfMM4=";
  };

  unpackPhase = ''
    tar xf $src
    tar xf ${pname}-${version}/${pname}-user-${version}.tar.gz
  '';

  sourceRoot = "${pname}-user-${version}";

  configurePhase = ''
    ./configure --sysconfdir=$out/etc --prefix=$out
  '';

  patches = [
    ../pkgs/linux-gpib/linux-gpib-user-4.3.3.patch
  ];
}
