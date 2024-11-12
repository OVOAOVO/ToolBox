@echo off
setlocal enabledelayedexpansion

rem 设置要检测的文件夹路径
set folderPath=D:\gaussian-splatting\EldenRing\input

rem 设置新文件名前缀
set newFileNamePrefix=new_file_

rem 初始化编号
set count=1

rem 遍历文件夹中的所有文件
for %%F in ("%folderPath%\*") do (
    rem 获取文件名
    set fileName=%%~nxF

    rem 检查文件名是否包含 ".png"
    if "!fileName:~-4!" == ".png" (
        rem 生成新文件名
        set newFileName=!newFileNamePrefix!!count!.png

        rem 重命名文件
        rename "%%F" "!newFileName!"

        echo Renamed %%F to !newFileName!

        rem 递增编号
        set /a count+=1
    )
)

pause
endlocal
