cls
$disPath =  "O:\PhD Thesis\DISSERTATION"
cd $disPath

$list = Get-ChildItem $disPath | Where-Object {$_.name -like "chapter*" -or $_.name -like "appendix*"}
#$list
foreach ($item in $list)
{
    bibtex "$($item.Name)/$($item.Name)"
    Write-Host "============================="
}

Write-Host "Press any key to continue ....."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")