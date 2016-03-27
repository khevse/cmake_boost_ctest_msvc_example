# cmake_boost_ctest_msvc_example

������ ������� � ��������������:
- cmake
- boost (��� ������)
- ctest
- microsoft visual studio

## ����������
1. C������ � ���������� cmake (https://cmake.org/download/)
2. C������ � ���������� visual studio (https://www.visualstudio.com/ru-ru/downloads/download-visual-studio-vs.aspx)
3. ������� ��������� ���������� boost (http://www.boost.org/users/download/)
   ������ ��������� ���������: C:\boost_1_60_0(boost, libs, docs, tools, ...)
4. ����������� � ������� C:\boost_1_60_0 ���� boost_install.bat
5. ���������� � ����� boost_install.bat ������ �������� ���������� "STUDIO_VERSION" � "ARCHITECTURE"
6. ��������� �� ���������� boost_install.bat
7. ��������� ���������� ������ ���������� boost
8. ���������� � ����� create_msvc_project.bat �������� ���������� "STUDIO_VERSION"
9. ��������� �� ���������� create_msvc_project.bat

����������� ������ ���� ������� � �������� visual studio ���������� � ���� ����-�����, ������� ������ �� ��������� CMakeLists.txt