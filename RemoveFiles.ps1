$disPath =  "O:\PhD Thesis\DISSERTATION"
cd $disPath

Get-ChildItem $disPath\*.aux -Recurse | ForEach-Object {
	Remove-Item "$($_.DirectoryName)\$($_.Basename).aux"
}

Get-ChildItem $disPath\*.tdo -Recurse | ForEach-Object {
	Remove-Item "$($_.DirectoryName)\$($_.Basename).tdo"
}

Get-ChildItem $disPath\*.blg -Recurse | ForEach-Object {
	Remove-Item "$($_.DirectoryName)\$($_.Basename).blg"
}

Get-ChildItem $disPath\*.out -Recurse | ForEach-Object {
	Remove-Item "$($_.DirectoryName)\$($_.Basename).out"
}