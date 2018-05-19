C# Script execution engine
---------------------------------------------------------------------

The MIT License (MIT)
Copyright (c) 2014 Oleg Shilo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---------------------------------------------------------------------

Contact: csscript.support@gmail.com

---------------------------------------------------------------------
Installation

Precondition: .NET runtime must be installed. You can download it from here or from other well known locations:
	http://www.microsoft.com/download/en/details.aspx?id=17851
	Despite the fact that you can select earlier versions of .NET as a target .NET Framework version 4.5 is 
        required for CS-Script to function properly.

To install:
   1. extract content of the cs-script.zip on your HD
   2. run css_config.exe or install.cmd (it will bring the configuration console)
   3. adjust the CS-Script settings in the configuration console according your needs (e.g. enabled debuggers, shell extensions...)
   
To uininstall:
   1. run css_config.exe
   2. press 'Deactivate' button on the 'General' tab in the configuration console
   
OR
   
   1. run unistall.cmd
 
To upgrade: No special steps are required. Just do as for normal installation according instructions above.
   
NOTE:
   - 'choco install cs-script' is a preferred deployment technique for CS-Script. If you installed it manually there is a good chance that the assemblies are locked by OS (can be checked in the file properties). This usually happens  WinZip or WinRar was used to unpack the package. Use 7zip to avoid this problem. 
   - After running css_config.exe from some third-party file navigation utilities (e.g. Total Commander)
   it might be required to restart this utility in order for changes to take effect.
   
---------------------------------------------------------------------
Installing on "Windows 7 family" OS

If during the installation you have "System.IO.FileNotFoundException: Could not load file or assembly 
'CSScriptLibrary" error this can be due to the new Win& security measures. You may want to "Unblock" all CS-Script 
files you downloaded. This can be done either manually or with Sysinternals Streams.exe utility:  
http://www.rogoff.uk.com/blog/post/How-to-bulk-unblock-files-in-Windows-7-or-Server-2008.aspx

---------------------------------------------------------------------

Running
 Script engine can be run in two different modes:
 as a console application (cscs.exe) and as a WinExe application (csws.exe).
 
C# Script execution engine. Version 3.21.0.0.
Copyright (C) 2004-2017 Oleg Shilo.

Usage: cscs.exe <switch 1> <switch 2> <file> [params] [//x]

<switch 1>

-help|-? [command]
    Displays either generic or command specific help info.

-e
    Compiles script into console application executable.

-ew
    Compiles script into Windows application executable.

-c[:<0|1>]
    Uses compiled file (cache file .compiled) if found (to improve performance).
       -c:1|-c  enable caching
       -c:0     disable caching (which might be enabled globally);

-ca
    Compiles script file into assembly (cache file .compiled) without execution.

-cd
    Compiles script file into assembly (.dll) without execution.

-check
    Checks script for errors without execution.

-proj
    Shows script 'project info' - script and all its dependencies.

-cache[:<ls|trim|clear>]
    Performs script cache operations.
     ls    - lists all cache items.
     trim  - removes all abandoned cache items.
     clear - removes all cache items.

-co:<options>
    Passes compiler options directly to the language compiler.
    (e.g.  -co:/d:TRACE pass /d:TRACE option to C# compiler
    or  -co:/platform:x86 to produce Win32 executable)

-s
    Prints content of sample script file
    (e.g. cscs.exe /s > sample.cs).

-wait[:prompt]
    Waits for user input after the execution before exiting.
    If specified the execution will proceed with exit only after any STD input is received.
    Applicable for console mode only.
    prompt - if none specified 'Press any key to continue...' will be used
    

-ac|-autoclass
    Automatically generates 'static entry point' class if the script doesn't define any.

        using System;
                 
        void Main()
        {
            Console.WriteLine("Hello World!";
        }

    Using an alternative 'instance entry point' is even more convenient (and reliable).
    The acceptable 'instance entry point' signatures are:
   
        void main()
        void main(string[] args)
        int main()
        int main(string[] args)
   
    Note, having any active code above entry point is acceptable though it complicates 
    the troubleshooting if such a code contains errors. (see http://www.csscript.net/help/AutoClass.html)

---------
<switch 2>

-nl
    No logo mode: No banner will be shown/printed at execution time.
    Applicable for console mode only.

-dbg|-d
    Forces compiler to include debug information.

-l
    'local' (makes the script directory a 'current directory').

-v
    Prints CS-Script version information.

-inmem[:<0|1>]
    Loads compiled script in memory before execution.
    This mode allows preventing locking the compiled script file. 
    Can be beneficial for fine concurrency control as it allows changing 
    and executing the scripts that are already loaded (being executed). This mode is incompatible 
    with the scripting scenarios that require scriptassembly to be file based (e.g. advanced Reflection).
        -inmem:1   enable caching (which might be disabled globally;
        -inmem:0   disable caching (which might be enabled globally;

-verbose
    Prints runtime information during the script execution.
    (applicable for console clients only)

-noconfig[:<file>]
    Do not use default CS-Script config file or use alternative one.
    Value "out" of the <file> is reserved for creating the config file (css_config.xml) with the default settings in the current directory.
    Value "print" of the <file> is reserved for printing the default config file content.
    (e.g. cscs.exe -noconfig sample.cs
    cscs.exe -noconfig:print > css_VB.xml
    cscs.exe -noconfig:c:\cs-script\css_VB.xml sample.vb)

-out[:<file>]
    Forces the script to be compiled into a specific location.
    Used only for very fine hosting tuning.
    (e.g. cscs.exe -out:%temp%\%pid%\sample.dll sample.cs

-sconfig[:file]
    Uses script config file or custom config file as a .NET app.config.
    This option might be useful for running scripts, which usually cannot be executed without configuration 
    file (e.g. WCF, Remoting). (e.g. if -sconfig is used the expected config file name is <script_name>.cs.config or 
    <script_name>.exe.config if -sconfig:myApp.config is used the expected config file name is myApp.config)

-r:<assembly 1>:<assembly N>
    Uses explicitly referenced assembly.
    It is required only for rare cases when namespace cannot be resolved into assembly.
    (e.g. cscs.exe /r:myLib.dll myScript.cs).

-dir:<directory 1>,<directory N>
    Adds path(s) to the assembly probing directory list.
    You can use a reserved word 'show' as a directory name to print the configured probing directories.
    (e.g. cscs.exe -dir:C:\MyLibraries myScript.cs
     cscs.exe -dir:-show).

-precompiler[:<file 1>,<file N>]
    Specifies custom precompiler. This can be either script or assembly file.
    Alias - pc[:<file 1>,<file N>]
    If no file(s) specified prints the code template for the custom precompiler. The spacial value 'print' has 
    the same effect (e.g. cscs.exe -pc:print).
    There is a special reserved word 'nodefault' to be used as a file name.
    It instructs script engine to prevent loading any built-in precompilers 
    like the one for removing shebang before the execution.
    (see http://www.csscript.net/help/precompilers.html)

-provider:<file>
    Location of alternative code provider assembly.
    If set it forces script engine to use an alternative code compiler.
    (see http://www.csscript.net/help/non_cs_compilers.html)

-syntax
    Prints documentation for CS-Script specific C# syntax.

-commands|-cmd
    Prints list of supporeted commands (arguments).

---------
file
    Specifies name of a script file to be run.

params
    Specifies optional parameters for a script file to be run.

//x
    Launch debugger just before starting the script.



**************************************
Script specific syntax
**************************************

Engine directives:
------------------------------------
//css_include <file>;

Alias - //css_inc
file - name of a script file to be included at compile-time.

This directive is used to include one script into another one.It is a logical equivalent of '#include' in C++.
This directive is a simplified version of //css_import.
If a relative file path is specified with single-dot preficx it will be automatically converted onto the absolute path 
with respect to the location of the file containing the directive being resolved.
Note if you use wildcard in the imported script name (e.g. *_build.cs) the directive will only import from the first
probing directory where the matching file(s) is found. Be careful with the wide wildcard as '*.cs' as they may lead to 
unpredictable behavior. For example they may match everything from the very first probing directory, which is typically a current 
directory. Using more specific wildcards is arguably more practical (e.g. 'utils/*.cs', '*Helper.cs', './*.cs')
------------------------------------
//css_import <file>[, preserve_main][, rename_namespace(<oldName>, <newName>)];

Alias - //css_imp
There are also another two aliases //css_include and //css_inc. They are equivalents of //css_import <file>, preserve_main
If $this (or $this.name) is specified as part of <file> it will be replaced at execution time with the main script full name (or file name only).

file            - name of a script file to be imported at compile-time.
<preserve_main> - do not rename 'static Main'
oldName         - name of a namespace to be renamed during importing
newName         - new name of a namespace to be renamed during importing

This directive is used to inject one script into another at compile time. Thus code from one script can be exercised in another one.
'Rename' clause can appear in the directive multiple times.
------------------------------------
//css_include <file>;

Alias - //css_inc
This directive is a full but more convenient equivalent of //css_import <file>, preserve_main;
------------------------------------

//css_nuget [-noref] [-force[:delay]] [-ver:<version>] [-ng:<nuget arguments>] package0[,package1]..[,packageN];

Downloads/Installs the NuGet package. It also automatically references the downloaded package assemblies.
Note:
  The directive switches need to be in the order as above.
  By default the package is not downloaded again if it was already downloaded.
  If no version is specified then the highest downloaded version (if any) will be used.
  Referencing the downloaded packages can only handle simple dependency scenarios when all downloaded assemblies are to be referenced.
  You should use '-noref' switch and reference assemblies manually for all other cases. For example multiple assemblies with the same file name that 
  target different CLRs (e.g. v3.5 vs v4.0) in the same package.
Switches:
 -noref - switch for individual packages if automatic referencing isn't desired. You can use 'css_nuget' environment variable for
          further referencing package content (e.g. //css_dir %css_nuget%\WixSharp\**)
 -force[:delay] - switch to force individual packages downloading even when they were already downloaded.
                  You can optionally specify delay for the next forced downloading by number of seconds since last download.
                  '-force:3600' will delay it for one hour. This option is useful for preventing frequent download interruptions
                  during active script development.
 -ver: - switch to download/reference a specific package version.
 -ng: - switch to pass NuGet arguments for every individual package.
Example: //css_nuget cs-script;
         //css_nuget -ver:4.1.2 NLog
         //css_nuget -ver:"4.1.1-rc1" -ng:"-Pre -NoCache" NLog
This directive will install CS-Script NuGet package.
(see http://www.csscript.net/help/script_nugets.html)
------------------------------------
//css_args arg0[,arg1]..[,argN];

Embedded script arguments. The both script and engine arguments are allowed except "/noconfig" engine command switch.
 Example: //css_args -dbg, -inmem;
 This directive will always force script engine to execute the script in debug mode.
------------------------------------
//css_reference <file>;

Alias - //css_ref
file - name of the assembly file to be loaded at run-time.

This directive is used to reference assemblies required at run time.
The assembly must be in GAC, the same folder with the script file or in the 'Script Library' folders (see 'CS-Script settings').
------------------------------------
//css_precompiler <file 1>,<file 2>;

Alias - //css_pc
file - name of the script or assembly file implementing precompiler.

This directive is used to specify the CS-Script precompilers to be loaded and exercised against script at run time just 
before compiling it. Precompilers are typically used to alter the script coder before the execution. Thus CS-Script uses 
built-in precompiler to decorate classless scripts executed with -autoclass switch.
(see http://www.csscript.net/help/precompilers.html
------------------------------------
//css_searchdir <directory>;

Alias - //css_dir
directory - name of the directory to be used for script and assembly probing at run-time.

This directive is used to extend set of search directories (script and assembly probing).
The directory name can be a wildcard based expression.In such a case all directories matching the pattern will be this 
case all directories will be probed.
The special case when the path ends with '**' is reserved to indicate 'sub directories' case. Examples:
    //css_dir packages\ServiceStack*.1.0.21\lib\net40
    //css_dir packages\**
------------------------------------
//css_resource <file>[, <out_file>];

Alias - //css_res
file     - name of the compiled resource file (.resources) to be used with the script. Alternatively it can be 
           the name of the XML resource file (.resx) that will be compiled on-fly.
out_file - optional name of the compiled resource file (.resources) to be generated form the .resx input.
           If not supplied then the compiled file will have the same name as the input file but the file extension '.resx' 
           changed to '.resources'.

This directive is used to reference resource file for script.
 Example: //css_res Scripting.Form1.resources;
          //css_res Resources1.resx;
          //css_res Form1.resx, Scripting.Form1.resources;
------------------------------------
//css_co <options>;

options - options string.

This directive is used to pass compiler options string directly to the language specific CLR compiler.
 Example: //css_co /d:TRACE pass /d:TRACE option to C# compiler
          //css_co /platform:x86 to produce Win32 executable

------------------------------------
//css_ignore_namespace <namespace>;

Alias - //css_ignore_ns
namespace - name of the namespace. Use '*' to completely disable namespace resolution

This directive is used to prevent CS-Script from resolving the referenced namespace into assembly.
------------------------------------
//css_prescript file([arg0][,arg1]..[,argN])[ignore];
//css_postscript file([arg0][,arg1]..[,argN])[ignore];

Aliases - //css_pre and //css_post
file    - script file (extension is optional)
arg0..N - script string arguments
ignore  - continue execution of the main script in case of error

These directives are used to execute secondary pre- and post-execution scripts.
If $this (or $this.name) is specified as arg0..N it will be replaced at execution time with the main script full name (or file name only).
You may find that in many cases precompilers (//css_pc and -pc) are a more powerful and flexible alternative to the pre-execution script.
------------------------------------
//css_host [-version:<CLR_Version>] [-platform:<CPU>]

CLR_Version - version of CLR the script should be execute on (e.g. //css_host /version:v3.5)
CPU - indicates which platforms the script should be run on: x86, Itanium, x64, or anycpu.
Sample: //css_host /version:v2.0 /platform:x86;
Note this directive only supported on Windows due to the fact that on Linux the x86/x64 hosting implemented via runtime launcher 'mono'.
These directive is used to execute script from a surrogate host process. The script engine application (cscs.exe or csws.exe) launches the script
execution as a separate process of the specified CLR version and CPU architecture.
------------------------------------
Note the script engine always sets the following environment variables:
 'pid' - host processId (e.g. Environment.GetEnvironmentVariable("pid")
 'CSScriptRuntime' - script engine version
 'CSScriptRuntimeLocation' - script engine location
 'EntryScript' - location of the entry script
 'EntryScriptAssembly' - location of the compiled script assembly
 'location:<assm_hash>' - location of the compiled script assembly.
                          This variable is particularly useful as it allows finding the compiled assembly file from the inside of the script code.
                          Even when the script loaded in-memory (InMemoryAssembly setting) but not from the original file.
                          (e.g. var location = Environment.GetEnvironmentVariable("location:" + Assembly.GetExecutingAssembly().GetHashCode());

The following is the optional set of environment variables that the script engine uses to improve the user experience:
 'CSS_NUGET' - location of the NuGet packages scripts can load/reference
 'CSSCRIPT_DIR' - script engine location. Used by the engine to locate dependencies (e.g. resgen.exe). Typically this variable is during the CS-Script installation.
 'CSSCRIPT_CONSOLE_ENCODING_OVERWRITE' - script engine output encoding if the one from the css_confix.xml needs to be overwritten.
 'CSSCRIPT_INC' - a system wide include directory for the all frequently used user scripts.
------------------------------------
During the script execution CS-Script always injects a little object inspector class 'dbg'.
This class contains static printing methods that mimic Python's 'print()'. It is particularly useful for object inspection in the absence of a proper debugger.
Examples:
    dbg.print("Now:", DateTime.Now)        - prints concatenated objects.
    dbg.print(DateTime.Now)                - prints object and values of its properties.
    dbg.printf("Now: {0}", DateTime.Now)   - formats and prints object and values of its fields and properties.
------------------------------------

Any directive has to be written as a single line in order to have no impact on compiling by CLI compliant compiler.
It also must be placed before any namespace or class declaration.

------------------------------------
Example:

 //css_include web_api_host.cs;
 //css_reference media_server.dll;
 //css_nuget Newtonsoft.Json;
 
 using System;
 using static dbg;
 
 class MediaServer
 {
     static void Main(string[] args)
     {
         print(args);
 
         WebApi.SimpleHost(args)
               .StartAsConosle("http://localhost:8080");
   }
 }

Or shorter form:

 //css_args -ac
 //css_inc web_api_host.cs
 //css_ref media_server.dll
 //css_nuget Newtonsoft.Json
 
 using System;
 
 void main(string[] args)
 {
     print(args);
 
     WebApi.SimpleHost(args)
           .StartAsConosle("http://localhost:8080");
 }
 
------------------------------------
 Project Website: https://github.com/oleg-shilo/cs-script


