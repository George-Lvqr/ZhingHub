rem ���ñ��������ж��Ƿ���ִ���
set error_occurred=false

rem 1.�����ļ�ndp48-web.exe��D�̸�Ŀ¼
copy "H:\���\ndp48-web.exe" "D:\" || set error_occurred=true

rem 2.����ndp48-web.exe
start "" "D:\ndp48-web.exe" || set error_occurred=true

rem 3.������Ϊ"PCL II"���ļ��У�����Ѵ��ڽ����ᱻ�ظ�����
if not exist "D:\PCL II" (
    mkdir "D:\PCL II" || set error_occurred=true
)

rem 4.����Plain Craft Launcher 2.exe�ļ���D:\PCLII,���ļ��Ѵ����򸲸�ԭ���ļ�
copy /y "H:\���\Plain Craft Launcher 2.exe" "D:\PCL II" || set error_occurred=true

rem 5.�����洴�������ļ��У��ֱ�Ϊ��ģ�顱�͡�Ƥ����
md "%userprofile%\Desktop\ģ��" || set error_occurred=true
md "%userprofile%\Desktop\Ƥ��" || set error_occurred=true

rem 6.ѯ���û��Ƿ�Ҫ����"ģ��"��"Ƥ��"�ļ�����������ġ�ģ�顱�ļ��к͡�Ƥ�����ļ�����
set /p copyConfirm=�Ƿ�ģ���Ƥ������������?(y/n)

if "%copyConfirm%"=="y" (
    rem ����ģ���ļ���
    xcopy /e /y "H:\Minecraft\ģ��" "%userprofile%\Desktop\ģ��" || set error_occurred=true
    rem ����Ƥ���ļ���
    xcopy /e /y "H:\Minecraft\Ƥ��" "%userprofile%\Desktop\Ƥ��" || set error_occurred=true
)

rem 7.������Ϸ�ļ���
if not exist "D:\PCL II\.minecraft" (
    mkdir "D:\PCL II\.minecraft" || set error_occurred=true
    echo Successfully created folder .minecraft in D:\PCL II
) else (
    echo Folder .minecraft already exists in D:\PCL II
)

rem 8.���������������ļ�
if not exist "D:\PCL II\PCL" mkdir "D:\PCL II\PCL" || set error_occurred=true
xcopy /s /e /h /y "H:\Minecraft\PCL" "D:\PCL II\PCL" || set error_occurred=true

rem 9.������Ϸ�ļ�
set "src_folder=H:\Minecraft\.minecraft"
set "dest_folder=D:\PCL II\.minecraft"

set /p copy_game_files=�Ƿ�Ҫ������Ϸ�ļ���(y/n)

if /I "%copy_game_files%"=="y" (
    xcopy "%src_folder%" "%dest_folder%" /H /E /V /I /Y || set error_occurred=true
    echo ��Ϸ�ļ��ѳɹ����ƣ�
) else if /I "%copy_game_files%"=="n" (
    echo ����������! ����ִ����һ��ָ��...
) else (
    echo ������Ч!
    set error_occurred=true
)

rem 10.�����û�ѡ������Plain Craft Launcher 2.exe
if /I "%copy_game_files%"=="y" (
    start "" "D:\PCL II\Plain Craft Launcher 2.exe" || set error_occurred=true
)

rem 11.��Windows��Դ���������ļ��С�D:\PCL II\��
start "" "D:\PCL II"

rem �ж��Ƿ���ִ��󣬲�ִ����Ӧ����
if %error_occurred%==true (
    echo ���й����г��ִ���,������ϱ���George,��������ر�...
    pause > nul
) else (
    rem �ر�������ʾ������
    exit
)
