# cmake_boost_ctest_msvc_example

Пример проекта с использованием:
- cmake
- boost (для тестов)
- ctest
- microsoft visual studio

## Инструкция
1. Cкачать и установить cmake (https://cmake.org/download/)
2. Cкачать и установить visual studio (https://www.visualstudio.com/ru-ru/downloads/download-visual-studio-vs.aspx)
3. Скачать исходники библиотеки boost (http://www.boost.org/users/download/)
   Пример структуры каталогов: C:\boost_1_60_0(boost, libs, docs, tools, ...)
4. Скопировать в каталог C:\boost_1_60_0 файл boost_install.bat
5. Установить в файле boost_install.bat нужные значения переменных "STUDIO_VERSION" и "ARCHITECTURE"
6. Запустить на исполнение boost_install.bat
7. Дождаться завершения сборки библиотеки boost
8. Установить в файле create_msvc_project.bat значение переменной "STUDIO_VERSION"
9. Запустить на исполнение create_msvc_project.bat

Результатом должен быть каталог с проектом visual studio включающий в себя юнит-тесты, который создан на основании CMakeLists.txt