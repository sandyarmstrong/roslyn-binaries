@ECHO OFF

PUSHD ..\..\roslyn
msbuild /v:m /m /p:Configuration=Release Roslyn.sln
POPD

RD /S /Q Release
MD Release

FOR %%A IN (
	Dlls\CodeAnalysis\Microsoft.CodeAnalysis
	Dlls\Features\Microsoft.CodeAnalysis.Features
	Dlls\EditorFeatures\Microsoft.CodeAnalysis.EditorFeatures
	Dlls\TextEditorFeatures\Microsoft.CodeAnalysis.EditorFeatures.Text
	Dlls\EditorFeatures.Next\Microsoft.CodeAnalysis.EditorFeatures.Next
	Dlls\Workspaces\Microsoft.CodeAnalysis.Workspaces
	Dlls\CSharpCodeAnalysis\Microsoft.CodeAnalysis.CSharp
	Dlls\CSharpFeatures\Microsoft.CodeAnalysis.CSharp.Features
	Dlls\CSharpEditorFeatures\Microsoft.CodeAnalysis.CSharp.EditorFeatures
	Dlls\CSharpWorkspace\Microsoft.CodeAnalysis.CSharp.Workspaces
	Vsix\VisualStudioSetup\System.Reflection.Metadata
	Vsix\VisualStudioSetup\System.Collections.Immutable
	Vsix\VisualStudioSetup\System.Composition.AttributedModel
	Vsix\VisualStudioSetup\System.Composition.Convention
	Vsix\VisualStudioSetup\System.Composition.Hosting
	Vsix\VisualStudioSetup\System.Composition.Runtime
	Vsix\VisualStudioSetup\System.Composition.TypedParts
) DO (
	XCOPY /Y /Q ..\..\roslyn\binaries\Release\%%A.dll Release
	IF EXIST ..\..\roslyn\binaries\Release\%%A.pdb XCOPY /Y /Q ..\..\roslyn\binaries\Release\%%A.pdb Release
)
