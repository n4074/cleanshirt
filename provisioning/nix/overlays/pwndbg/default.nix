self: super:
{
  # see fixed.nix for the full changed derivation
  # This is a temporary fix for pwndbg because setuptools wasn't being properly injected into the pwndbg wrapper
  pwndbg = super.pwndbg.overrideAttrs(oldAttrs: rec { 
    propagatedBuildInputs = oldAttrs.propagatedBuildInputs ++ [ super.python3Packages.setuptools ];
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ super.python3Packages.wrapPython ];
    preFixup = "program_PYTHONPATH=$PYTHONPATH patchPythonScript $out/share/pwndbg/gdbinit.py";
  });
}