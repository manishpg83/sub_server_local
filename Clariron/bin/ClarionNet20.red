-- Default Redirection for Clarion.NET 2.0

[Copy]
-- Directories only used when copying dlls
*.dll = %BIN%;%BIN%\AddIns\BackendBindings\ClarionBinding\Common;%ROOT%\Accessory\bin;%libpath%\bin\%configuration%

[Debug]
-- Directories only used when building with Debug configuration

*.FileList.txt = obj\debug
*.pdb = bin\debug
*.lib = obj\debug

[Release]
-- Directories only used when building with Release configuration

*.FileList.txt = obj\release
*.pdb = bin\release
*.lib = obj\release

[Common]
*.chm = %BIN%;%ROOT%\Accessory\bin
*.tp? = %ROOT%\template\dotnet
*.trf = %ROOT%\template\dotnet
*.txs = %ROOT%\template\dotnet
*.stt = %ROOT%\template\dotnet
*.*   = .; %ROOT%\libsrc\dotnet; %ROOT%\images; %ROOT%\template\dotnet

*.hlp = %BIN%;%ROOT%\Accessory\bin
*.dll = %BIN%;%ROOT%\Accessory\bin
*.exe = %BIN%;%ROOT%\Accessory\bin
*.tp? = %ROOT%\Accessory\template\dotnet
*.txs = %ROOT%\Accessory\template\dotnet
*.stt = %ROOT%\Accessory\template\dotnet
*.dll = %ROOT%\Accessory\bin
*.*   = %ROOT%\Accessory\images; %ROOT%\Accessory\resources; %ROOT%\Accessory\libsrc\dotnet; %ROOT%\Accessory\template\dotnet
