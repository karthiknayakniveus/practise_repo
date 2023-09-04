# Define the directory path you want to list files from
$directoryPath = "/home/karthik/Demofile"

# Use Get-ChildItem to list the files in the directory
$files = Get-ChildItem -Path $directoryPath

# Iterate through the list of files and print their names
foreach ($file in $files) {
    Write-Host $file.Name
}
