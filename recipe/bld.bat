@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols

:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml || goto :error

:: build
cargo install --no-track --locked --root "%PREFIX%" typos-cli || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
