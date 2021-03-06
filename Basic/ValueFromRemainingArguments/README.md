
The parameter attribute `ValueFromRemainingArguments` is a handy feature in
special cases. All unknown parameters and arguments go to this parameter
value. A command processes it as required by its design.

But such a parameter introduces unfortunate side effects. For example, if a
standard parameter name in a command contains a typo then it is not an error
anymore. Instead, the wrong parameter goes to `ValueFromRemainingArguments`.
Depending on a scenario, a command may even work without errors with such a
mistake. But the results are going to be wrong, more likely.

Some known built-in commands with `ValueFromRemainingArguments` parameters,
see [Get-VFRACommandParameter.ps1](Get-VFRACommandParameter.ps1):

    Command        Parameter
    -------        ---------
    ForEach-Object RemainingScripts
    ForEach-Object ArgumentList
    Get-Command    ArgumentList
    New-Module     ArgumentList
    Read-Host      Prompt
    Trace-Command  ArgumentList
    Write-Host     Object
    Write-Output   InputObject

The script [Test-1.ps1](Test-1.ps1) shows how a typo in the parameter name of
`Get-Command` is not treated as an error and the command does not fail, too.
But it gets a wrong result.
