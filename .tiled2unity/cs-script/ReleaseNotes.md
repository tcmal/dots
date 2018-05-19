# Release v3.28.4.0

* CS-Script v3.28.4.0
  - Added resolving GAC assemblies on Mono (when running on Windows)
  - Implemented resolving custom config file specified by file name only (local with respect to cscs.exe)
  - Command `-stop` now stops syntaxer.exe as well

* CS-Script.Core v1.0.1.0
  - Implemented resolving `using` into assemblies from 'dotnet\shared' folder
  - Issue #110: Compiling to Byte[]/File in .NET Standard
  - Issue #106: Fix netstandard2 version to work in 4.6.1 and fix ReferenceDomainAssemblies
