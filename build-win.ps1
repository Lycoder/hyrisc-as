$VERSION_TAG = git describe --always --tags --abbrev=0
$COMMIT_HASH = git rev-parse --short HEAD

md -Force -Path bin > $null

c++ main.cpp `
    -DHYRISC_AS_VERSION_TAG="`"$($VERSION_TAG)`"" `
    -DHYRISC_AS_COMMIT_HASH="`"$($COMMIT_HASH)`"" `
    -o bin\hyrisc-as.exe `
    -O3