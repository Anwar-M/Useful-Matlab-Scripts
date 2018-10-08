Try {
   taskkill /F /IM acroRd32.exe 
} catch {}

cls
$disPath =  "O:\PhD Thesis\DISSERTATION"
cd $disPath

pdflatex -synctex=1 -interaction=nonstopmode dissertation.tex

$list = Get-ChildItem $disPath | Where-Object {$_.name -like "chapter*" -or $_.name -like "appendix*"}
#$list
foreach ($item in $list)
{
    bibtex "$($item.Name)/$($item.Name)"
    Write-Host "============================="
}

pdflatex -synctex=1 -interaction=nonstopmode dissertation.tex
pdflatex -synctex=1 -interaction=nonstopmode dissertation.tex

&"C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" /A "page=5" dissertation.pdf