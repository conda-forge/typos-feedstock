:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

:: build
cargo install --locked --root "%PREFIX%" --path . || goto :error

:: strip debug symbols
strip "%LIBRARY_PREFIX%\bin\typos.exe" || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1