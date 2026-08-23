param(
    [switch]$Clean,
    [switch]$Open
)

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ProjectRoot

$MainFile = "main.tex"
$PdfFile  = "main.pdf"

function Test-Command {
    param([string]$Name)
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Remove-BuildFiles {
    $extensions = @(
        "*.aux", "*.bbl", "*.bcf", "*.blg", "*.fdb_latexmk",
        "*.fls", "*.lof", "*.log", "*.lot", "*.nav", "*.out",
        "*.run.xml", "*.snm", "*.synctex.gz", "*.toc", "*.vrb"
    )

    foreach ($pattern in $extensions) {
        Get-ChildItem -Path $ProjectRoot -Recurse -File -Filter $pattern -ErrorAction SilentlyContinue |
            Remove-Item -Force -ErrorAction SilentlyContinue
    }

    Write-Host "Build fajlovi su očišćeni." -ForegroundColor Green
}

if ($Clean) {
    Remove-BuildFiles

    if (-not $Open) {
        exit 0
    }
}

if (-not (Test-Path $MainFile)) {
    Write-Error "Nije pronađen '$MainFile' u folderu: $ProjectRoot"
}

Write-Host ""
Write-Host "Hiperion Abridged - LaTeX build" -ForegroundColor Cyan
Write-Host "Folder: $ProjectRoot"
Write-Host ""

if (Test-Command "latexmk") {
    Write-Host "Koristim latexmk + XeLaTeX..." -ForegroundColor Yellow

    & latexmk `
        -xelatex `
        -interaction=nonstopmode `
        -halt-on-error `
        -file-line-error `
        $MainFile

    if ($LASTEXITCODE -ne 0) {
        throw "LaTeX build nije uspeo."
    }
}
elseif (Test-Command "xelatex") {
    Write-Host "latexmk nije pronađen. Koristim XeLaTeX direktno..." -ForegroundColor Yellow

    for ($i = 1; $i -le 3; $i++) {
        Write-Host "XeLaTeX prolaz $i/3..." -ForegroundColor DarkGray

        & xelatex `
            -interaction=nonstopmode `
            -halt-on-error `
            -file-line-error `
            $MainFile

        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX build nije uspeo u prolazu $i."
        }
    }
}
else {
    Write-Host ""
    Write-Host "Nisu pronađeni ni 'latexmk' ni 'xelatex'." -ForegroundColor Red
    Write-Host ""
    Write-Host "Instaliraj LaTeX distribuciju koja sadrži XeLaTeX, npr.:"
    Write-Host "  - MiKTeX: https://miktex.org/download"
    Write-Host "  - TeX Live: https://tug.org/texlive/"
    Write-Host ""
    Write-Host "Posle instalacije zatvori i ponovo otvori PowerShell."
    exit 1
}

if (Test-Path $PdfFile) {
    $pdf = Resolve-Path $PdfFile
    Write-Host ""
    Write-Host "Build uspešan:" -ForegroundColor Green
    Write-Host "  $pdf"
    Write-Host ""

    if ($Open) {
        Start-Process $pdf
    }
}
else {
    throw "Build je završen bez greške, ali '$PdfFile' nije pronađen."
}
