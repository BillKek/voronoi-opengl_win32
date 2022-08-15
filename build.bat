SET PATH=C:\msys32\mingw32\bin

rem i live msys2 and packages authors
copy C:\msys32\mingw32\lib\libfreeglut_static.a C:\msys32\mingw32\lib\libfreeglut.a 

SET PKGS=--static freeglut glfw3

rem inspired  https://stackoverflow.com/questions/2323292/assign-output-of-a-program-to-a-variable-using-a-ms-batch-file
pkg-config --cflags %PKGS% >temp.txt
set /p PKGSCFLAGS=<temp.txt
pkg-config --libs %PKGS% >temp.txt
set /p PKGLIBS=<temp.txt
del temp.txt

gcc -Wall -Wextra -o voronoi-ppm %PKGSCFLAGS% src/main_ppm.c %PKGLIBS% -static
gcc -Wall -Wextra -o voronoi-opengl %PKGSCFLAGS% src/main_opengl.c %PKGLIBS% -static

