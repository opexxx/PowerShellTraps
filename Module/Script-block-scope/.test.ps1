
# Synopsis: Expected results.
task Test-Script1 {
	($r = .\Test-Script1.ps1)
	equals $r[0] 'Local message: Default local message.'
	equals $r[1] 'Local message: New local message.'
	equals $r[2] 'Local message: New custom message.'
	equals $r[3] 'Global message: Default global message.'
}

# Synopsis: $r[2] is different.
task Test-Module1-as-command {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -Command .\Test-Module1.ps1)
	equals $r[0] 'Local message: Default local message.'
	equals $r[1] 'Local message: New local message.'
	equals $r[2] 'Local message: New local message.'
	equals $r[3] 'Global message: Default global message.'
}

# Synopsis: $r[2] and $r[3] are different.
task Test-Module1-as-file {
	($r = PowerShell -Version $PSVersionTable.PSVersion -NoProfile -File .\Test-Module1.ps1)
	equals $r[0] 'Local message: Default local message.'
	equals $r[1] 'Local message: New local message.'
	equals $r[2] 'Local message: New local message.'
	equals $r[3] 'Global message: New custom message.'
}
