Get-ChildItem -Recurse -Include *.ts,*.tsx,*.js,*.jsx | 
  Where-Object { $_.FullName -notmatch 'node_modules|dist' } |
  ForEach-Object {
    (Get-Content -Raw $_.FullName) -replace "from\s+['""]shellies-ds9['""]","from '@buddyshome/shellies-ds9'" |
    Set-Content $_.FullName
  }