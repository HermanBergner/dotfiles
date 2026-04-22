pbi() {
  # no args → just open Power BI Desktop
  if [[ $# -eq 0 ]]; then
    powershell.exe -NoProfile -Command '
      $app = Get-StartApps "Power BI Desktop"
      if ($app) {
        Start-Process "shell:AppsFolder\$($app.AppID)"
      } else {
        Write-Host "Power BI Desktop not found."
      }
    '
    return
  fi

  local input="$1"
  # Make absolute (expand ~, handle relative)
  local abs
  abs=$(realpath -m -- "$input") || { echo "pbi: cannot resolve path: $input" >&2; return 1; }

  # If user passed a native Windows path already (C:\… or \\…),
  # keep it; otherwise convert WSL → Windows.
  local winpath="$abs"
  case "$input" in
    [A-Za-z]:\\*|\\\\*) ;;   # already Windows-style
    *) winpath=$(wslpath -w -- "$abs") ;;
  esac

  # Verify file exists from WSL side before handing off to Windows
  [[ -f "$abs" ]] || { echo "pbi: file not found: $abs" >&2; return 1; }

  # Open via Windows file association (works reliably with Store apps like Power BI)
  powershell.exe -NoProfile -Command "Invoke-Item -LiteralPath '$winpath'"
}
