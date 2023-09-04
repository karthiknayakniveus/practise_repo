# Specify the commit range you want to compare
$commit1 = (git log --pretty=format:%H -n 1 HEAD~0)
$commit2 = (git log --pretty=format:%H -n 1 HEAD~1)

$sourceDirectory = "/home/karthik/Demofile"  # Current directory
$targetDirectory = "/home/karthik/Downloadfilelist"

$addedFiles = git diff --name-only $commit1 $commit2

foreach ($file in $addedFiles) {
    $sourcePath = Join-Path -Path $sourceDirectory -ChildPath $file
    $targetPath = Join-Path -Path $targetDirectory -ChildPath $file
    Copy-Item -Path $sourcePath -Destination $targetPath
}
