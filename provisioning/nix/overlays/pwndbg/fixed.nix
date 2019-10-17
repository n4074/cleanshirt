{ stdenv
, fetchFromGitHub
, makeWrapper
, gdb
, future
, isort
, psutil
, pycparser
, pyelftools
, python-ptrace
, ROPGadget
, six
, unicorn
, pygments
, setuptools
, wrapPython
, }:

stdenv.mkDerivation rec {
  pname = "pwndbg";
  version = "2019.01.25";

  src = fetchFromGitHub {
    owner = "pwndbg";
    repo = "pwndbg";
    rev = version;
    sha256 = "0k7n6pcrj62ccag801yzf04a9mj9znghpkbnqwrzz0qn3rs42vgs";
  };

  nativeBuildInputs = [ makeWrapper wrapPython ];

  propagatedBuildInputs = [
    future
    isort
    psutil
    pycparser
    pyelftools
    python-ptrace
    ROPGadget
    six
    unicorn
    pygments
    setuptools
  ];

  installPhase = ''
    mkdir -p $out/share/pwndbg
    cp -r *.py pwndbg $out/share/pwndbg
    makeWrapper ${gdb}/bin/gdb $out/bin/pwndbg \
      --add-flags "-q -x $out/share/pwndbg/gdbinit.py"
  '';

  preFixup = ''
    program_PYTHONPATH=$PYTHONPATH patchPythonScript $out/share/pwndbg/gdbinit.py
  '';

  meta = with stdenv.lib; {
    description = "Exploit Development and Reverse Engineering with GDB Made Easy";
    homepage = http://pwndbg.com;
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mic92 ];
  };
}
