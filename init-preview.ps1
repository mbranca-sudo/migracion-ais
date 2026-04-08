#Define Global Function 'Build-Preview'
# - parameter[0]:   template Name
# - must have 'C:\temp\GDTransform\GDTransform.exe' intalled.
function global:Build-Preview {
    Param
    (
        # parameter[0]:     Template Name
        [Parameter(Mandatory=$true, Position=0, ParameterSetName='Name')]
        [string] $Name
    )

    write-output "Build Preview (for '$Name') started"

    #get reference to 'Template File' and 'Data File'
    $templateFile = Get-ChildItem -Path . -Filter *.hbs.html | Where-Object {$_.Name -eq $Name+".hbs.html"}
    $dataFile = Get-ChildItem -Path . -Filter *.data.json -Recurse | Where-Object {$_.Name -eq $Name+".data.json"}

    #write-output $templateFile.FullName
    #$templateFile.FullName
    #$dataFile.FullName

    write-output "Call Transform HBS to HTML"
    C:\temp\GDTransform\GDTransform.exe $templateFile.FullName $dataFile.FullName

    write-output "Build Preview done"
}