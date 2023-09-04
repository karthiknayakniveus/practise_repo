# Specify the commit range you want to compare
$commit1 = (git log --pretty=format:%H -n 1 HEAD~0)
$commit2 = (git log --pretty=format:%H -n 1 HEAD~1)

# Create the directory to store downloaded files
$downloadDirectory = "C:\path\to\your\directory"  # Replace with your desired directory path
New-Item -ItemType Directory -Force -Path $downloadDirectory

# Loop through the added files and copy them to the directory
git diff --name-only $commit1 $commit2 | ForEach-Object {
    $file = $_
    $targetPath = Join-Path -Path $downloadDirectory -ChildPath $file
    git show "$commit2:$file" | Set-Content -Path $targetPath
}
