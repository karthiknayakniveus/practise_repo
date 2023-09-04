# Specify the commit range you want to compare
$commit1 = (git log --pretty=format:%H -n 1 HEAD~0)
$commit2 = (git log --pretty=format:%H -n 1 HEAD~1)

$downloadDirectory = "/home/karthik/Downloadfilelist"

$addedFiles = git diff --name-only $commit1 $commit2

foreach ($file in $addedFiles) {
    $sourcePath = "git show $($commit2):$file"
    $targetPath = Join-Path -Path $downloadDirectory -ChildPath $file
    Copy-Item -Path $sourcePath -Destination $targetPath
}
