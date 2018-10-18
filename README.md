# Useful-Scripts
This repo contains handy scripts (mostly Matlab) for general use
With powershell scripts (*.ps1) are related to compiling your thesis using the TU Delft template. Using the template can be quite annoying, even using a dedicated latex editor. As every chapter has its own bibliography it has to be compiled seperately.

Q: "How do I run a powershell script?"

A: Start the command prompt. Typoe 'powershell' and press enter. This will enter Windows Powershell and you should be able to run the script. It can be that your computer requires administrative rights...

<RemoveFiles.ps1>:
Is an easily adjustable script which removes files of a certain extension in a folder and its sub-folders. This was used for cleaning up files produced by latex whenever unexpected errors occurred.

<CompileDissertationComplete.ps1>: 
A script which does this for you. In this case it assumes that the thesis (and the main tex file named <dissertation.tex>) to be located in 'O:\PhD Thesis\DISSERTATION'. This can be changed. Additionally, the loop assumes (for running bibtex) that within this directory every chapter has its own directory with a main file inside. For chapter 1 this would be 'O:\PhD Thesis\DISSERTATION\chapter-1\chapter-1.tex', and for other chapters similarly. For the appendix it is 'O:\PhD Thesis\DISSERTATION\appendix\appendix.tex'.

The starts by closing Acrobat Reader, compile the thesis, runs bibtex for every chapter and finally compile the thesis again two times. If the pdf reader is located in the given path in the last line, it will open the resulting pdf.
