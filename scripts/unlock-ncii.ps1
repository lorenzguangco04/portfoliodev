$ErrorActionPreference = 'Stop'

$qpdf = 'C:\Program Files\qpdf 12.4.2\bin\qpdf.exe'
$certificate = Join-Path $PSScriptRoot '..\src\image\NC.pdf'
$output = Join-Path $PSScriptRoot '..\src\image\NC-unlocked.pdf'
$temporaryOutput = "$output.tmp.pdf"

if (-not (Test-Path -LiteralPath $qpdf)) {
  throw "qpdf was not found at '$qpdf'. Install qpdf and run this script again."
}

if (-not (Test-Path -LiteralPath $certificate)) {
  throw "The source certificate was not found at '$certificate'."
}

$securePassword = Read-Host 'Enter the current NCII PDF password' -AsSecureString
$passwordPointer = [IntPtr]::Zero
$process = $null

try {
  $passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
  $password = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
  $startInfo = [Diagnostics.ProcessStartInfo]::new()
  $startInfo.FileName = $qpdf
  $startInfo.Arguments = '@-'
  $startInfo.UseShellExecute = $false
  $startInfo.CreateNoWindow = $true
  $startInfo.RedirectStandardInput = $true

  $process = [Diagnostics.Process]::new()
  $process.StartInfo = $startInfo
  if (-not $process.Start()) {
    throw 'Could not start qpdf.'
  }

  $process.StandardInput.WriteLine('--password')
  $process.StandardInput.WriteLine($password)
  $process.StandardInput.WriteLine('--decrypt')
  $process.StandardInput.WriteLine((Resolve-Path -LiteralPath $certificate).Path)
  $process.StandardInput.WriteLine([IO.Path]::GetFullPath($temporaryOutput))
  $process.StandardInput.Close()
  $process.WaitForExit()

  if ($process.ExitCode -ne 0) {
    throw "qpdf could not decrypt the certificate (exit code $($process.ExitCode)). Check the password and try again."
  }

  & $qpdf --check $temporaryOutput
  if ($LASTEXITCODE -ne 0) {
    throw 'qpdf could not validate the decrypted certificate.'
  }

  Move-Item -LiteralPath $temporaryOutput -Destination $output -Force
  Write-Output "Created unencrypted certificate copy: $([IO.Path]::GetFullPath($output))"
  Write-Output 'The original NC.pdf was left unchanged.'
}
finally {
  if ($process) {
    $process.Dispose()
  }
  if ($passwordPointer -ne [IntPtr]::Zero) {
    [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($passwordPointer)
  }
  $password = $null
  $securePassword.Dispose()
  if (Test-Path -LiteralPath $temporaryOutput) {
    Remove-Item -LiteralPath $temporaryOutput -Force
  }
}
