Add-Type -AssemblyName PresentationFramework

$result = [System.Windows.MessageBox]::Show(
    "Do you want to continue?",
    "Confirmation",
    [System.Windows.MessageBoxButton]::YesNo,
    [System.Windows.MessageBoxImage]::Question
)

if ($result -eq "Yes") {
    Write-Host "User clicked Yes"
} else {
 
 Write-Host "User clicked No"
}