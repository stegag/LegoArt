# Fix number alignment in algo.js
$filePath = "app\js\algo.js"
$content = Get-Content $filePath -Raw

# First replacement - drawStudCountForContext function
$pattern1 = 'ctx\.fillText\(number, x - \(scalingFactor \* \(1 \+ Math\.floor\(number / 2\) / 6\)\) / 8, y \+ scalingFactor / 8\);'
$replacement1 = 'const numberText = String(number);
        const textWidth = ctx.measureText(numberText).width;
        ctx.fillText(numberText, x - textWidth / 2, y + scalingFactor / 8);'
$content = $content -replace $pattern1, $replacement1

# Second replacement - generateInstructionPage function  
$pattern2 = 'ctx\.fillText\(\s*studToNumber\[pixelHex\],\s*x - \(scalingFactor \* \(1 \+ Math\.floor\(studToNumber\[pixelHex\] / 2\) / 6\)\) / 8,\s*y \+ scalingFactor / 8\s*\);'
$replacement2 = 'const numberText = String(studToNumber[pixelHex]);
            const textWidth = ctx.measureText(numberText).width;
            ctx.fillText(numberText, x - textWidth / 2, y + scalingFactor / 8);'
$content = $content -replace $pattern2, $replacement2

Set-Content $filePath -Value $content -NoNewline

Write-Host "Successfully updated number alignment in algo.js"
