

# Define the paths to the two directories
$folder1Path = "/home/karthik/Demofile"
$folder2Path = "/home/karthik/Downloadfilelist"

# Get the list of files in each directory
$filesInFolder1 = Get-ChildItem -Path $folder1Path -File | Select-Object -ExpandProperty FullName
$filesInFolder2 = Get-ChildItem -Path $folder2Path -File | Select-Object -ExpandProperty FullName

# Compare the lists of files and find the differences
$filesNotInFolder2 = Compare-Object -ReferenceObject $filesInFolder1 -DifferenceObject $filesInFolder2 |
    Where-Object { $_.SideIndicator -eq "=>" } |
    Select-Object -ExpandProperty InputObject

# Display the files in Folder1 that are not in Folder2
if ($filesNotInFolder2.Count -gt 0) {
    Write-Host "Files in Folder1 that are not in Folder2:"
    $filesNotInFolder2
} else {
    Write-Host "No files found in Folder1 that are not in Folder2."
}



